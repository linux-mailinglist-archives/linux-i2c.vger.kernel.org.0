Return-Path: <linux-i2c+bounces-1665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FBE84E601
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 18:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FBF528A6DD
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 17:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1D2823CB;
	Thu,  8 Feb 2024 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdQK8wfF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E28002C
	for <linux-i2c@vger.kernel.org>; Thu,  8 Feb 2024 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411827; cv=none; b=H7/Jl/bSaScLOSCyXy2VdHt8D1v7dXvYXJteFeW9gY/ptdXpBAy4hlol99WEPepdKfpPJ7XYCS/h0PPhZM5t45mSdIgFUhirH0TkeOdu0s1QBiAtWJOHfoOuDrW9DknZKjJmV2dnhjZWdAlEZ7UlqADqY3bZYtyGV+VmSeKnbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411827; c=relaxed/simple;
	bh=Vl728SroNlcdjflbTnvcVpCqfGMH8sJC0MGppF+mtxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lydk0KjKLL8pdt3MGsQoP6Vv5OCahrk+mDv+tzrLBANFcNEQPjZnaOA3p/jUU0dG1TtnqQhFFbej/w5sJts7tkGHZkVGivS3OmaioIxL9fhoFe6m/o6IjHdhxJYE42AfB89xEZ+3ARBSh+kljr7a/d9pi29rVRgV2NJVtHNwNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdQK8wfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6FBC433F1;
	Thu,  8 Feb 2024 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707411827;
	bh=Vl728SroNlcdjflbTnvcVpCqfGMH8sJC0MGppF+mtxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdQK8wfFrYFotJNQrcUn0dNLoMSBFuSzYXcdm0SEURmPwyUQIkGY+I3riL3OKvVu2
	 /0820gTzVOdHhKDDhrOyXjPjqnyGQVn8QIepMRGUTQ2KL9BvfE0zCnitNFwvDdOcxN
	 YCzS+OnM4y+2L2BfcbdPztzeGyf0h6lmyHMqjQb8bnTjXQCYIwXUpa/zl14B4nXiPQ
	 2dZgPsKXoh8hziUtk6tW8OUO21S5z415ZYl3QRI1E4CbiT8dgnOye+9Js//mgkiwZe
	 UypFBcMMHG0BZ2D2ScRE4lcdakqqowd1L97dLEeT5mTO2Q+VmlkujdSwnwYKXMjxwN
	 xzVZGv0r9Gb6g==
Date: Thu, 8 Feb 2024 18:03:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 4/5] i2c: i801: Add SMBUS_LEN_SENTINEL
Message-ID: <z6kouw7lyw5ntrerrjnsj7ufu2d7hsxdnsfoxz26vv3xisy4lz@ls2obqiyrg7u>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
 <0af53713-4b30-458e-9970-260a38871506@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0af53713-4b30-458e-9970-260a38871506@gmail.com>

Hi Heiner,

On Fri, Feb 02, 2024 at 08:04:06AM +0100, Heiner Kallweit wrote:
> Add a sentinel length value that is used to check whether we should
> read and use the length value provided by the slave device.
> This simplifies the currently used checks.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

