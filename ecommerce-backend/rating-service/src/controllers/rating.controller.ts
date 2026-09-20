
import { Request, Response } from "express";
import {
  addRating,
  getProductRatings,
  deleteRating,
} from "../services/rating.service";

export async function createRating(
  req: Request,
  res: Response
) {
  const userId = (req as any).user.userId;

  const rating = await addRating({
    userId,
    productId: req.body.productId,
    rating: req.body.rating,
    review: req.body.review,
  });

  res.json(rating);
}

export async function getRatings(
  req: Request,
  res: Response
) {
  const productId = String(
    req.params.productId
  );

  const ratings =
    await getProductRatings(productId);

  res.json(ratings);
}

export async function removeRating(
  req: Request,
  res: Response
) {
  const userId = (req as any).user.userId;

  const ratingId = String(
    req.params.id
  );

  const result =
    await deleteRating(
      ratingId,
      userId
    );

  res.json(result);
}

