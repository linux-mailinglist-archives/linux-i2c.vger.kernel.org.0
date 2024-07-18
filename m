Return-Path: <linux-i2c+bounces-5015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724F934684
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 04:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D6F91F2193D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 02:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FB029408;
	Thu, 18 Jul 2024 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="unGqN80n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE8027713;
	Thu, 18 Jul 2024 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721271205; cv=none; b=Dt9O84tG142o6g/ZWLucw8E0JeLCsotH2M+PpWYxQsiLRjsvS8KXrt2cMYrwfEv43V4zcV+nEj5JMFkAKuOAVCOBOReGoK6BeDAd+Oysy7e0OxFge3ix2IT5maD7KqNTdaWd5BMmHgBCXntltMHDOel63jy3N9GS0HxNl0/SpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721271205; c=relaxed/simple;
	bh=DkX4qpFWIc4gHvzenkio0kFDrFxOx5kMbHNjMatt/1g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=d8svcmdRcFOPt9iKThE7s3VCeFxt1kJnZPc0IxN71jwk1L7VvouzxPtFGrkO+Ej1KoNyN4BCW/FaSyJV0pMCV8cjZopnVAZ8YDwO2dffkiczr75bv7dttHqZQGFD3xk6/LfUs6hwgO2/9zoboJQX0/Unr5AWmKXWT1TIKQOnQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=unGqN80n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419E4C2BD10;
	Thu, 18 Jul 2024 02:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721271204;
	bh=DkX4qpFWIc4gHvzenkio0kFDrFxOx5kMbHNjMatt/1g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=unGqN80nDx3J9QE4qIA2RmEMZ5v7FpTdKIRZNJddZuBo8Na7WlcyFfvWidfZnwT+G
	 OntEyx5oAi/sjqEy7MNs3iDWOe5dEGCuMGQBf6aYsDHhCD+Q+lpUiBhMZEywxTLVm6
	 lzLJxSnGlbVPobPwduIYP5B+FufUuTX+iwEiM3xI=
Date: Wed, 17 Jul 2024 19:53:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, urezki@gmail.com, hch@infradead.org,
 linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, s.hauer@pengutronix.de,
 christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-Id: <20240717195323.d2dbfed9835ba7e2d769921e@linux-foundation.org>
In-Reply-To: <20240718011504.4106163-2-mstrodl@csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
	<20240718011504.4106163-2-mstrodl@csh.rit.edu>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jul 2024 21:15:02 -0400 Mary Strodl <mstrodl@csh.rit.edu> wrote:

> After the ability to allocate PAGE_KERNEL_EXEC memory was removed
> from __vmalloc

Removed by which commit?

> this seems like the least invasive way to expose
> the capability to drivers that need it.
> 
> Exports __vmalloc_node_range so that drivers can use it.

Why does this driver need a thing which no other driver does?



