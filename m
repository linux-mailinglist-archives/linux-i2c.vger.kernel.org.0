Return-Path: <linux-i2c+bounces-15093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B416D18310
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 11:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37FC9303D88E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942F3349B1D;
	Tue, 13 Jan 2026 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bTwKlxI0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48C25783C
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301103; cv=none; b=ULElUzwrXcrLyQ9wUHDx8wl6F3612n1aX6LgLgde1lnIEBsC+oepaSw9XX4rl5u/mZ5ei3++XHFu7sfSmQloDcXtZg8H5i7VdQZQV2LxHKx1SkdmUaMMf23kYC9FqQdASxShLmyqZGLvg3j1FDjS4CNQagfLcON3U9FICxZ02qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301103; c=relaxed/simple;
	bh=HbS0CedmhsBby5my0etEwrSLi/DDs8uKq43u6/Xgpd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeZ1Day+rYZbpKiArIxVCie5TbBuZwZ2r8bndwzJ+pG/8nK65xcfVYm+b0p44ByhSd4KpJ9rL28fCQn5zK0klu57HN4cKxzsdzHn3PGUqrHK+39ejNC6iqywAMAZmy4opmFfvqUIrkVUhEuA/yk91rgHJjKBMD6FYfoqRnxMjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bTwKlxI0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m2C1
	Cq0R3bvdmMZOqB7Bn3CVMUrTKnWJxHrygGNnHrE=; b=bTwKlxI0nNgr2gHLIeSB
	hDI8XILoB+81bZJ+jIufbsZhBJUuEzmD0vh5h+s9IvO7roXyWaEULZ7Wn79e3tZN
	in9xNMNISPenr4zopohkNIgTmUXV5kVd5Naaxc/Q+RkmzEj0rhg6aIpiO2DM5+Sq
	G2MZj+FXPLVXoEliD3QywcEJ2j9O5lUCV7w2AVODnlPdN+3v//mswbc39uTttSta
	rJn5n8o5kAKnugMOZvIHvbsx1Jrj2UzDhtJwYpPzRl5Az2uRstgYvdFvudaWXdZR
	B/Ijw+Tq6rUSmi2kZ6fTvMXr/5iH+i83NRWekmbXSSfCLOD5Nrp9U1iz7SZpS5l0
	kg==
Received: (qmail 1645245 invoked from network); 13 Jan 2026 11:44:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:44:54 +0100
X-UD-Smtp-Session: l3s3148p1@a+yNrkJIftoujnvx
Date: Tue, 13 Jan 2026 11:44:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYiJbtueA8g3srn@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>

Hi Bart,

> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

I haven't actually tested the code yet (but will do so this week). But I
already want to feed back that I approve of the general concept of
abstracting away drivers access to the struct device by something we can
then convert to SRCU in a central place.

This mail is to discuss the timeline of these series. My preferred
solution is to aim for inclusion right after 7.0-rc1 is released. That
gives me enough time to test and you some more time to address review
comments. Bold wish, but maybe we can even get dependencies into 6.19
before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
for it already?).

Does that work for you?

Happy hacking and thanks again for doing all this!

   Wolfram


