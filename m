Return-Path: <linux-i2c+bounces-12723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918BB47E14
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 22:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04D0817D782
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 20:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC8D1F4C99;
	Sun,  7 Sep 2025 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VfiTznfO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D61D5AC6
	for <linux-i2c@vger.kernel.org>; Sun,  7 Sep 2025 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757276399; cv=none; b=CKttfGVz9GIeot172O/6pPpfUBPCkgihOATueegFzu9efAEVsWLuYAyPzKwKytqDWZ7FkCQ8HihJweoZV+xToEJfijI9AHQsQhAw3C6cTEKezjfeMFEyD1CEVffTus8gfm0k6eU148O6wEw9XlYuW0Z04/EaXZ8/XG791n5Eb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757276399; c=relaxed/simple;
	bh=tbNO7YgL8Ap35tuGWrY12HSrQ97vZE6MU7VTvP2cjA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvvuCrIueo6evWO+Du5NLlxv/M+42GtSpik72zN/TbK6dY1l/9gl72+gP6uNvZpQJO+/4vyUYdnhJckpUAo1utZKKrHx6h1+FwNhBok2rZanMhVwCiEdCwEwSAYv0Hsgqj+ygopQOs3jmldtHT5PCy7X3GilywU9dcj7+ZD+jIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VfiTznfO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tbNO
	7YgL8Ap35tuGWrY12HSrQ97vZE6MU7VTvP2cjA4=; b=VfiTznfOA1ckkoraiCXo
	syOJbOCkqA9SV1J3qxWFhUuqFVtbrqT9FdsX4+3CyfpRrTFSw6B4RRRbUZ6KlBMl
	hHiueYr36mW+WWq4OhKmAZQTG3aSVj8FzmLXEtUD2UvhZfMwdseAQD3yJdwGY/8z
	Ze6ze6dG3ZMLi7UEbYLNlsrCRQJjL+mtbYoDehi34lWM3Ny2SDP+wwvcckTKyXeO
	Z/87R8DlJthDpaCNGKXhWrcYqEj4ytqEJthl9VulzCR7X+BZ75bNeX/NR3PTT1do
	mzrwoaxJmVvFpSQIxUmtpiHSOyXCLd9/imwXq70FWzzMmhKdcQKqlATtMUMGQoYw
	Yw==
Received: (qmail 575095 invoked from network); 7 Sep 2025 22:19:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2025 22:19:55 +0200
X-UD-Smtp-Session: l3s3148p1@8+VQyzs+XNsujntE
Date: Sun, 7 Sep 2025 22:19:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Degao Lan <landegao@sina.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: fix comment typo in i2c.h
Message-ID: <aL3o6w9pjxhZxcnV@ninjato>
References: <20250907140111.40925-1-landegao@sina.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907140111.40925-1-landegao@sina.com>

On Sun, Sep 07, 2025 at 10:01:11PM +0800, Degao Lan wrote:
> There is a typo in comment. We should fix this.

No, 'iff' means 'if and only if'.


