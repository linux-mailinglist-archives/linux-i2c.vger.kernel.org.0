Return-Path: <linux-i2c+bounces-5030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C9937029
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 23:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A65428210B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 21:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC5D143C54;
	Thu, 18 Jul 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C5uwVE+W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AF75808;
	Thu, 18 Jul 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721338766; cv=none; b=hbVB4W0yFp6CYISJj9wE+tzXXCC1dT/YPh7pxyEtGvBcdX4ufiw/g587biQnCCGeP2lSryn2kg14QEyLzl9KdRshBBTGlcH7FWDNgtVp9D7LvedxlLlKQjBdJfwoDDeziOwILT1XZ1I9Io0XeKpbZ91D5A0kiKYWfY3hATujCPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721338766; c=relaxed/simple;
	bh=1vemEz9v2ZfVJQz5qFol65v7z8bNWLCfqrLNWGqSW9k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eXCsrZSv3j0fTFJ37Qk3MNFWJBwKXCQDU175qltIImDJuLhGjN8mfBSheL/wVNFFxdD+vLATMKOlTnWAOsQg5GhA0ZvquvZzI1gIyrDc/b2YYkTr0aU8mXgubeC93fOEr9nwLQpAMrGqIP4jdhFO+vpP8bcBa73J7K34IKTS57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C5uwVE+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB00C116B1;
	Thu, 18 Jul 2024 21:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721338765;
	bh=1vemEz9v2ZfVJQz5qFol65v7z8bNWLCfqrLNWGqSW9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C5uwVE+WuGYVEP+EfoaGTH0egMeuxcIV6Vm9cVoB6rEhDtwj1RUfOt1C2PVjAjqkZ
	 8kbOGjIJmCYvTRNaYUV0at+3Ij1b6myuuGUSvCBezOuhQgCBomwGn2+clUi7A6APjf
	 /p9xb8FB8FS2oO75ddEFyWhpfRm+DVaedFG15yM4=
Date: Thu, 18 Jul 2024 14:39:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mary Strodl <mstrodl@freedom.csh.rit.edu>, Christoph Hellwig
 <hch@infradead.org>, Mary Strodl <mstrodl@csh.rit.edu>,
 linux-kernel@vger.kernel.org, urezki@gmail.com, linux-mm@kvack.org,
 lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-Id: <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
In-Reply-To: <ZpmKho9_t0_MeOP7@casper.infradead.org>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
	<20240718011504.4106163-2-mstrodl@csh.rit.edu>
	<ZpiGIbczW4iItKVx@infradead.org>
	<ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
	<ZpkOV3mdOU1b8vMn@casper.infradead.org>
	<ZpkPStwq_S3mJYb5@infradead.org>
	<ZpkQQ5GzJ4atvR6a@casper.infradead.org>
	<ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
	<20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
	<ZpmKho9_t0_MeOP7@casper.infradead.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Jul 2024 22:35:02 +0100 Matthew Wilcox <willy@infradead.org> wrote:

> On Thu, Jul 18, 2024 at 02:31:03PM -0700, Andrew Morton wrote:
> > The hardware is weird, but we should try to support it in some fashion.
> 
> Why?  It's been around since 2005, and Linux has done perfectly well
> without support for it. 

Oh.  I was assuming it was some new thing.  This does weaken the case
a lot.

