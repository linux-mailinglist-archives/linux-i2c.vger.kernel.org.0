Return-Path: <linux-i2c+bounces-11997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B9B0E443
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 21:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B75D1C8612C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 19:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C1D284695;
	Tue, 22 Jul 2025 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ELHw1DGQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA227FB31
	for <linux-i2c@vger.kernel.org>; Tue, 22 Jul 2025 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753212593; cv=none; b=ER+t+kLNrkno/SKt2Uddcp5BHrXqbyNHW+u+v/Va+SPBu+4+ZRclZ/C1RYajHBryM3kbf/dKkAfH/geD+uddpwjeUGkTpvHUpxWIfDNrDVE5Ew0eV6+ux91tczhD8BdwObzc+/cmoTq49VDLtRZOypsgmIAXgHcFGr7uSjUofzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753212593; c=relaxed/simple;
	bh=PjDiRkY5uWwFlYHEvwWF1S7VH52PqK/0R12qz1fVdk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgdzLli9h1s0ZB52gKXpS4OxrC0oPPTJJ88nl4h2uGLcFTKykGa86zv2wgna6w2M22Zac0jQAB1GKz97txO1yASucZP9hqyXGbhHuJDQZ+yOXxvht/ZAaVjMUNqeV+GK4jjf6CFVKUEtVep5o1YFMJtT5sKKwPd7HlmPZvjqscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ELHw1DGQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5FB6
	piNcSCqXPj8XyWPIK6sWRwt6wWecKxoTcdO51wU=; b=ELHw1DGQLESLJ0D6baKQ
	36DV/M6tZn26g6rqWD6QJWek+x2Prb5a3agW5V0+Hkal2pmxdNZ+sDBkAog92ULO
	HrlMV/NF3X/wiyyKK6kxBg58GVqpWQyBNqbhhvgHmonTdyVGBo0JSL9VUWxzbiVM
	a+kplmcaOxI864kZoim3ArxslF4RtCJJPH2uoR5Cde2I1JF+wg0MKCfEonnKRco9
	Q8X9OhjPRGtyzDki5bfD2xfHz5Cq4ZO0Ha/NzzR6fG+Y59zLuU1AcTK885lXxtVf
	EEz9BsJCv+SH9gc7XB7XguQ7vybzZ/CVafeRlDbr2btQjrcLDsxwQFymqmBopVb6
	eQ==
Received: (qmail 1432259 invoked from network); 22 Jul 2025 21:29:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:29:49 +0200
X-UD-Smtp-Session: l3s3148p1@EqCbnYk6duYgAwDPXyBWAATEinPyanBm
Date: Tue, 22 Jul 2025 21:29:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc7
Message-ID: <aH_mrS9DwnMhvPe9@shikoro>
References: <2lbfr4r4icozrhnh5vgitzc6dylnxvh7x6fkdytacsy3oncsfe@7usj2u6nbk45>
 <aH0zRiDe75dAPHkk@shikoro>
 <wxsmvpqszpz5rcutlqzuznmur2snfgvilpukxmlzdtvqxmlv5u@njfcqtmmbrio>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wxsmvpqszpz5rcutlqzuznmur2snfgvilpukxmlzdtvqxmlv5u@njfcqtmmbrio>

Hi Andi,

> sorry, I missed your second e-mail and I misunderstood your first
> e-mail (I thought you haven't pulled anything, yet).

Oh, okay, noted. Will try to be less ambiguous in the future!

> OK, I will now rebase everything missing on top of rc7.

Perfect, thank you!

   Wolfram


