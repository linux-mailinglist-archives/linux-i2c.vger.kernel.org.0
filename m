Return-Path: <linux-i2c+bounces-5022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D525934D56
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 14:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA10B22B15
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 12:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A04313BC12;
	Thu, 18 Jul 2024 12:40:32 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B127448;
	Thu, 18 Jul 2024 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306432; cv=none; b=rl5qKc6w1lYVk4djXfLADxdbAgGuBGlbER+IanMXToVJOaG+HZS3KN6TwsX67OZskRceVP6dhYdiWl2XK/YfY0e8d7AwuvUrU3FUj677hEXYtzhKNdHvoaTliZG7Iqhwqj73D3HKYk5muz6o8PfJuYyY3/ggHAzmeVz2197ACvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306432; c=relaxed/simple;
	bh=Ph/orsGQZfBassPxjJuuazPuq62SnGzkpgp5aA31j5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqIVWJAnIhBQiNfHXntN1ZENeGjxZm1aTFuuo0NqtHFQlDbsO2pW6KZeZdaBOI+W0q+ISGuKFpguYcWmBJcberQ3Bcgm1t2PnyVtHJJ8mVvm/W3RiUE6/Ilp+uEY4mkQRMzz+USbuXfNl2jQGuzjKu8rVbLvYpnkzlVsZCXQpc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2E3B440D7C89;
	Thu, 18 Jul 2024 08:40:29 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p_NXtbJXWZoP; Thu, 18 Jul 2024 08:40:28 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id C2CBE45735E9;
	Thu, 18 Jul 2024 08:40:28 -0400 (EDT)
Date: Thu, 18 Jul 2024 08:40:27 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Christoph Hellwig <hch@infradead.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpiGIbczW4iItKVx@infradead.org>

On Wed, Jul 17, 2024 at 08:04:01PM -0700, Christoph Hellwig wrote:
> NAK to a driver creating random writable and exectutable memory:

Is there a better way to do what I'm trying to do? Or some way to
expose this functionality with more guard rails so that it's a
little bit safer?

Thank you for taking time to review my patches!

