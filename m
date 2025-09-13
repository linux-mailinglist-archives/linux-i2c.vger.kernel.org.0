Return-Path: <linux-i2c+bounces-12938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3CB55FF4
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 11:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EB685A20F3
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 09:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317652E8B90;
	Sat, 13 Sep 2025 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SPvrMojw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1828FD;
	Sat, 13 Sep 2025 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755916; cv=none; b=gA6ZLb0NJ2dzmuErh2DA+Jm+Lck/h4GNyBkBQ2Y2v0b9rbtkXylMwfr8EkUUdfsWmLUtGBfZRw/Q0PSx8biFg1yvEs1gsvOGf66mpn0ibKnYR8NwPE4B9m9AYRt0dWLCQpilAU3B4EgNMD1DDw5BHC+B25Ydzxg2og0O5K7HDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755916; c=relaxed/simple;
	bh=i/90t0EIiI8YT4SDcQlBv+MxfSzMFscIihlKp+m74p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0FqPosprEF46ABgGMymX2cNZIGN2xw1Y0Y5LULgIMstx9O8iwKoM0QgcfiZ2/B9yjQ57erWDID3vNmX3nHXTRaCovzuTNoqzE1JEl0JQlTscU2EiDXMhk7n7eay7vqBmkWZtt0RFCo5OH2QRxCRMokRwQegPTYpmAjpsajnc7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SPvrMojw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AD9F6664;
	Sat, 13 Sep 2025 11:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757755827;
	bh=i/90t0EIiI8YT4SDcQlBv+MxfSzMFscIihlKp+m74p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPvrMojwHgYf8KJbiXp0FAFeMMXBQZBtETs17QcPzsV2r2CAwhylnATx03eubg2j5
	 XxD7prpuuzSAc0nrCVYf6L3ixLhxOYg/zxhKvwZj80EfndTrfnJ0FdjO6Y1ofCRRpJ
	 r/Yn3sKRv6TAYhiRzj78N583eJ7fCaFUTnG2EBAU=
Date: Sat, 13 Sep 2025 12:31:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-media@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <20250913093118.GA4842@pendragon.ideasonboard.com>
References: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>
 <aMShqlBgHXHIExDC@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aMShqlBgHXHIExDC@shikoro>

On Sat, Sep 13, 2025 at 12:41:46AM +0200, Wolfram Sang wrote:
> On Wed, Aug 13, 2025 at 12:49:23PM +0300, Laurent Pinchart wrote:
> > Usage of the clock-frequency property for camera sensors is discouraged
> > in favour of using assigned-clock-rates (and assigned-clock-parents
> > where needed). Mark the property as deprecated.
> > 
> > Update the examples accordingly. In DT examples where the sensor input
> > clock appears to come from a programmable clock generator, replace
> > clock-frequency by the assigned-clocks and assigned-clock-rates
> > properties. Otherwise, just drop clock-frequency.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Changes since v2:
> > 
> > - Don't remove clocks property in samsung,exynos4212-fimc-is.yaml
> > 
> > Changes since v1:
> > 
> > - Adapt examples in bindings that reference sensors
> > ---
> >  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
> 
> Can I have this i2c change seperately to avoid dependencies?

I'm afraid it has been merged in the media tree already.

-- 
Regards,

Laurent Pinchart

