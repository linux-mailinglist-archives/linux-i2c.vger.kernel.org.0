Return-Path: <linux-i2c+bounces-5234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7894C7D1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 02:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 393A51F238EA
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 00:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A096FDC;
	Fri,  9 Aug 2024 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHhZUR2S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEB4C80;
	Fri,  9 Aug 2024 00:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723164924; cv=none; b=dqg5HBAZBcBUmeu/Xz3ZQSl/+c4stR9FizvwknwQtAo+QRk442ZRiIaiVIMR6PU2ZUFArCckRdzo2Q6ZEjVkGyJ2Kor6MbtfU9eI1R16+krLb7aWX+CqR9tGMJrtEndmkyWNjBAXQqeLevfhyQwyYzU+aZAfhRT0qBpFdRnTPss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723164924; c=relaxed/simple;
	bh=RhQojpL0Hy01EezhbkD+iRO1/vupD1lsoA7uPl1jJMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMVoCNd7JzPl9Hs5lLfNUeePy1t98U31quSYHiWXWAZSJjH+npczzazNgOAAxt9+JsOEXzMynE7uSSQuDpmt1ryO1Qf5/RkH+Gjc+JbjJQrd5p1aU5F2o73oQ619un86l1xaSdwbwoe57n9RoGWvgZl5fyt439y6E0fGHnvD5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHhZUR2S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FF6C32782;
	Fri,  9 Aug 2024 00:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723164923;
	bh=RhQojpL0Hy01EezhbkD+iRO1/vupD1lsoA7uPl1jJMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHhZUR2SRY7BtMppDISbqjYffmLrzp9GKeqK0Kvo3UMTq8I5oROFFBsXz/JGJ/l8C
	 ySX96N9sTxiEXzxjjvCiedx3PgJGuMl0Y7nWm8aq/KGQLDjpAy7/34pn+M9A2VFdoZ
	 rD5903+FwF7GO+QEf4pKqcyPwjGp/wcJmq9Wwwbeer7YZboKtkoUsSG0JgjXk7IRx8
	 mq7HAx+gvRK0N0kymjIHKjsI0rmW6yzQdzxK7L3Ncs0XnqXJc9yUhUoNNTCKHn8aLO
	 JWEWaim50NzL8pv4Vz21URdXMoAZ2oaym+kyYNgCbAKCDyIUyCSkzS1b738ZpgXlfQ
	 dSXxNnP/Re8qA==
Date: Fri, 9 Aug 2024 01:55:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org, lee@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v3 2/2] i2c: Add Congatec CGEB I2C driver
Message-ID: <htilttfnytacgk6rqsnmeamyvoaglfwhwbgkc6cxkxt5h4yk3n@l65rbpa6mkfy>
References: <20240808183527.3950120-1-mstrodl@csh.rit.edu>
 <20240808183527.3950120-3-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808183527.3950120-3-mstrodl@csh.rit.edu>

Hi Mary,

just skimmed through fast...

> +		dev_dbg(&adapter->dev,
> +				"%s: rd: %p/%ld wr: %p/%ld flags: 0x%08lx %s\n",
> +				__func__, rdbuf, rdlen, raw_wrbuf, wrlen + 1,
> +				flags,
> +				msgs[i].flags & I2C_M_RD ? "READ" : "WRITE");

please mind the alignment: align everuthyng under the "(".

...

> +	ret = i2c_add_adapter(&priv->adapter);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "registration failed\n");
> +		return ret;

please use dev_err_probe();

Andi

