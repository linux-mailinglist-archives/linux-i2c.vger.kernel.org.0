Return-Path: <linux-i2c+bounces-5055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5DD93AA0E
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2024 02:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88D3C283011
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2024 00:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82031819;
	Wed, 24 Jul 2024 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EzJL24fz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E753360;
	Wed, 24 Jul 2024 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721779245; cv=none; b=seJbbjxS7epBTrP/vsuSsuGLfUA0V8hXKh4+H9yUI3R9tqLojhDyza66pyMApVwWJrR0xpSBOGe2pqmhI7zO7Rfxf2uaqFnvj5XKyeTispUP+Pp5B7vSM+SljZ303oJTGdOg0dfUrCdnhKndmfouBD0dQKeIi6iSaJUjTSjluP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721779245; c=relaxed/simple;
	bh=rmPwjbRwV6UTdwW/TMU/GQEr4t+ww1mvGbY0I1Jio4I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JnH8/7wNp89BViI3xxU9dwiYLwndbOiB+DJm93Uj1+3yg0wIgPO9BwwYp9BZIHwVI1o1M2HptwGRJME+30Zfekp7pbJ7TjRYiUiJ2OSkOgEByuU5sqApys1fmqBq+3yFmYyiZmvleAeUiJsSLNsWwov74vfumViaZqrxEzmCZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EzJL24fz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6B3C4AF09;
	Wed, 24 Jul 2024 00:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721779244;
	bh=rmPwjbRwV6UTdwW/TMU/GQEr4t+ww1mvGbY0I1Jio4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EzJL24fzv8TXjAMRAncNA302gR1raXLAmZS8qFPzPtg5BQDHZq+w+eGRadykzdRbX
	 I+WIwhSzV9XOf5c4B/DZN/RifOkeM4r6XxmY5e+PgjJNKrhZL3MvP6NmVr1G8ZDC8z
	 087khawI0nFNKkk6Lxgxr8uvTpVS5dx/1egnwT9Q=
Date: Tue, 23 Jul 2024 17:00:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mary Strodl <mstrodl@freedom.csh.rit.edu>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Christoph Hellwig <hch@infradead.org>, Mary
 Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
 urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-Id: <20240723170043.4f17a3d0b6280e57561ba1f5@linux-foundation.org>
In-Reply-To: <ZppfQFdwYq-bf9Wv@casper.infradead.org>
References: <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
	<ZpkOV3mdOU1b8vMn@casper.infradead.org>
	<ZpkPStwq_S3mJYb5@infradead.org>
	<ZpkQQ5GzJ4atvR6a@casper.infradead.org>
	<ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
	<20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
	<ZpmKho9_t0_MeOP7@casper.infradead.org>
	<20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
	<CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
	<ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
	<ZppfQFdwYq-bf9Wv@casper.infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Jul 2024 13:42:40 +0100 Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Jul 19, 2024 at 07:58:40AM -0400, Mary Strodl wrote:
> > Maybe some of the stuff the driver does right now could be moved into
> > vmalloc? In other words, we could provide a different function that
> > allocates an executable page, copies memory into it, then marks it
> > read-only. Would that do better to alleviate concerns?
> 
> No.  We are not running arbitrary x86 code.  That is a security
> nightmare.

Sure, if such a thing were to be done we'd want it localized within the
driver rather than offered globally.

But if there was some hack within the driver to do this, what problems
might that cause?  What are the scenarios?


