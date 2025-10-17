Return-Path: <linux-i2c+bounces-13617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC8BEBB87
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 22:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFEA119C3244
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 20:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AF61D5CC6;
	Fri, 17 Oct 2025 20:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgMufUkP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594A354AC3;
	Fri, 17 Oct 2025 20:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734077; cv=none; b=bAC0kSWQmjhmY2KuRHLn8ff+A2sGqh7Aj+r3cdMVSIqXYtg9dLorJDOvhA/BRq7GtBfP4pt0Ae9VrHQQZy7MVb119sLkuv1Vyna803shfzob9v79FSRfDfvw1Ea12ck7XqiJA7Ek7mn5xUkPs/fKAAIaygsoirKythyPA4QFMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734077; c=relaxed/simple;
	bh=O8fQW7RQR2qcHxqYBZ3Q/tOPGBCdUxepaseyU6sgiZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flAXrE168p2yqOLq6YSO1OW+rptL/8vKSNtmSuFkSvaXYcO9by1j99T99Yiq0Ja3+f7UD/ISlYheXKBYJH9hnMDdH1jjqhTrDnoUFwq94Fz+JfeTNoJFo/YBpCQpzm/JvpK/02jFzuQIlu1dKCn1GQqly4qcnG6Z0R5Mfx1QQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgMufUkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2D1C4CEE7;
	Fri, 17 Oct 2025 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760734077;
	bh=O8fQW7RQR2qcHxqYBZ3Q/tOPGBCdUxepaseyU6sgiZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgMufUkPPVGZnew4j1HY0sMIV4nLX1GA42qX7jzXzOBanz5iYxkIdA+Lm3tXWDcAG
	 aDwwlHUuPLA0ZbgsCH9I1cVaX25+BLIRaO9HuTFhpqFGbq256fiL60JPhCvfHdjv0J
	 uempxQ3eOCfWzdlsjhbNx1dRJ5+QNC3hFvExjIWBPh5pvV9dq6qjUt5rdaXR0nCZBG
	 gzWtadRywTqSra2R54fAenvEq1kb/mmTvcIpEiiZXDpgKSmC13SphNxKgqLYdhcp0b
	 o0H5i5/khbIlkuUeAtPWJOtRM5nj76Dxb9MHlVACynY/qKDc1XYo3aVizPfyi5d0oK
	 bYjEDwr9mO6zQ==
Date: Fri, 17 Oct 2025 22:47:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] i2c: pcf8584: Remove debug macros from
 i2c-algo-pcf.c
Message-ID: <vop42qhict2oqppb6ozg46fxwwwk5egp2po4rlnxhhjlt4xojc@yq77b2qmx6eq>
References: <aNbWejNZLYGuNvCI@ninjato>
 <20250927041400.172949-1-chiru.cezar.89@gmail.com>
 <20250927041400.172949-2-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927041400.172949-2-chiru.cezar.89@gmail.com>

Hi Cezar,

On Sat, Sep 27, 2025 at 07:13:58AM +0300, Cezar Chiru wrote:
> Remove debug macros and printk and dev_debg function calls from file
> as no change was done for 16 years.

You have also removed the module parameter.

> Request by I2C SUBSYSTEM maintainer Wolfram Sang.

Please, remove this last sentence, it's not a useful information
to add in a git log. You can either add it in the cover letter or
after the "---" section. I'd say in the cover letter as you have
already done.

The patch looks good. Thanks for taking care of it.

Andi

