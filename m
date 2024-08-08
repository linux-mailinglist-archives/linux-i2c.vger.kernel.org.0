Return-Path: <linux-i2c+bounces-5228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77094C4CE
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 20:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2691D1F29025
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 18:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB7C156C71;
	Thu,  8 Aug 2024 18:44:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44AC158A26;
	Thu,  8 Aug 2024 18:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142680; cv=none; b=WJj5rOUwe07o25OBMO/anl09tTcetCS57YZWXZ2ju+qQb0s8qPxhZdRWvCTm2vkoTwGkJ1MF+nJEXpPuK0LDrFMFOY0kyMbjHZIdfkBLmwEpMwU1yF6igIAAvRHNpmkGJtVa8ifHVovNiJHeDetx83S5ISCqS1gZIu14cHdaXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142680; c=relaxed/simple;
	bh=BrG1hOrvpqVVINvq796fs69iI5xhqx+FVnRDbJIXpsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSmiRxYIzkJp/5CwpKvJss+zpY6nH0XXSHkUnjFUC6HFxiKgH1oYZYCXmSKSzHcePIZXv/lOsPysvotMBDu1O7d82GXAmKqbxn9NWh9RaesosptOaLx8c46/vh9z05ssMV14ZOZ4ykaGG7E8XIfVXbJEq22ormLl7bbOXF6ijAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id A44AE457383A;
	Thu,  8 Aug 2024 14:44:37 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id K5WNqbOHpoyn; Thu,  8 Aug 2024 14:44:37 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 17A1540E0F54;
	Thu,  8 Aug 2024 14:44:37 -0400 (EDT)
Date: Thu, 8 Aug 2024 14:44:36 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
	linux-mm@kvack.org, lee@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v2 2/2] i2c: Add Congatec CGEB I2C driver
Message-ID: <ZrUSFBFtTNP9iGs2@freedom.csh.rit.edu>
References: <20240801160610.101859-1-mstrodl@csh.rit.edu>
 <20240801160610.101859-3-mstrodl@csh.rit.edu>
 <p3g2ikhn54roye5t7moatrqbaudl65jarpimhoguojz5f7gnz2@2i4npjg3jdrv>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p3g2ikhn54roye5t7moatrqbaudl65jarpimhoguojz5f7gnz2@2i4npjg3jdrv>

On Thu, Aug 08, 2024 at 12:21:24AM +0100, Andi Shyti wrote:
> However, I'm going to ask to please run checkpatch.pl fix the
> suggested output and resend it.

Thanks for taking a look! I didn't know about checkpatch and
sparse before now, so I appreciate the messages :)

I sent a new version (v3) that should address the feedback.

