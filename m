Return-Path: <linux-i2c+bounces-5021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA750934D3A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 14:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 202EEB21D8B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 12:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A59113C3E6;
	Thu, 18 Jul 2024 12:29:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9813BC30;
	Thu, 18 Jul 2024 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721305799; cv=none; b=PuQnD4vraMgsLMCa6inydcMuv0SqIPwHX0L1C07B0I9iGpzk7fQqU/v8y5uGz6dCVHqQlGveIX4HYUXPLmK+PKYqcXV3UBtTK+PRNxMPAIk62Th+fI8sOyXMoVGYCIzfEivvGB2/c5DIaE4mojhpz4luw9uifu+xW+eoJf/BPwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721305799; c=relaxed/simple;
	bh=uGLci3G3CluuKVeU2XOyycapjskHnGmaNMSEgCwxXUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDU6YeWHjCcVrF4lsyLxwfjUOO0L5AWZdtk03LpJu6wYhT6PQqph/iuML4sZr3h8q1x5rkidrCq2LZVLtsN8+3cNurNs57is9r1GbkU6jYRJ0AdBmBe7R4ppbf1+XlEMImJ4Ma1Ih8K9pkBaCTjueqDeyohMh41S2GX8MlwI1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id D24B040D7C79;
	Thu, 18 Jul 2024 08:29:55 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id utouI5Lyf7EE; Thu, 18 Jul 2024 08:29:54 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id AD26A45735E9;
	Thu, 18 Jul 2024 08:29:54 -0400 (EDT)
Date: Thu, 18 Jul 2024 08:29:53 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpkKwfESyr91ekco@freedom.csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <20240717195323.d2dbfed9835ba7e2d769921e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717195323.d2dbfed9835ba7e2d769921e@linux-foundation.org>

On Wed, Jul 17, 2024 at 07:53:23PM -0700, Andrew Morton wrote:
> Removed by which commit?

Thanks. This was removed in:
88dca4ca5a93 mm: remove the pgprot argument to __vmalloc

It was removed because every driver was passing PAGE_KERNEL

> Why does this driver need a thing which no other driver does?

You can	find more information in the manufacturer's docs:
https://www.congatec.com/fileadmin/user_upload/Documents/Manual/CGOSAPI.pdf

In particular, section 1 (page 11) describes how they intend for
it to work.

Basically, they	provide	an x86 blob in the BIOS	that we	copy
into kernelspace and mark executable. Then, we can call into that
blob to access congatec's special hardware.

Thanks again for reviewing my patches!

If there is a better way to do what I'm trying to do, please let
me know. It's possible I'm missing something obvious.

