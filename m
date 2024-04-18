Return-Path: <linux-i2c+bounces-3013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187C8AA286
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 21:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B367D1C20EBE
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 19:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD6B17AD8E;
	Thu, 18 Apr 2024 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVhupnak"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7FC6A00E;
	Thu, 18 Apr 2024 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713467282; cv=none; b=h3YH+Xdp5Az6bmfq/sWtgkO0yoo3Z1+0LyW8EdX8DWlsp9RF2iZu7EZ4joM1K9zkZoSBBt/nh0m75lfQen3JGqmTW01IU/zVl0jzCq2pzfJK+Ds+zmelu9nvvnEM0zURzqYrUT5/2k7C550fkmg1k8xd6Kbylmn0WJH7NNEYZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713467282; c=relaxed/simple;
	bh=J8yymRG1v/hdKHhQf+Yv8z5rLLYjaZdZtyBBRJeGn8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bb7wwgTQaheR+/QRFJB+U9wGmt1oPxAJsoxbKpdtDScPsOBMcqpKsDe7I3RswhBry8Lxdb5xvr2esL0LK1V7ktHRyxyvCp/6/+kLDTSAeIhmSFofINbZBphj+N5lrWHwLXStqeSqX+ExniXeayPO+vgy/7uKNdW103bgAKI8jaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVhupnak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA5AC113CC;
	Thu, 18 Apr 2024 19:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713467282;
	bh=J8yymRG1v/hdKHhQf+Yv8z5rLLYjaZdZtyBBRJeGn8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVhupnakZOt1L/qnBucazXggWLk1UCbyoV7Y0/KGhEMTATeQAv8ksca/WYPpg1q7V
	 odmS5LVimcbojj3QMN7k6Js+B7bHu6NThQLMtPCsbPHi8QoU16Su2oAm7iRkrFHOWD
	 CGW+F8zYKcwCly3DWhGJjckIxXB8ew4rBg3fkXU6ZMcqS9FC6j8JXgq+e1SPIyGbXg
	 16moe/WtaYJ9O1rOnx3WPVlR9iT0QwW11eG8M+x9ZD43G21yKIWqWqctTBVfTdKql4
	 sO7v9RQyJqfAiik6QZ+M9g6gJtlS3IpOBDmcX7qi34MptwYO8gstP80LEbuiizIQa1
	 ARg8rhN13nnNA==
Date: Thu, 18 Apr 2024 21:07:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Suneel Garapati <sgarapati@marvell.com>, 
	Chandrakala Chavva <cchavva@marvell.com>, Jayanthi Annadurai <jannadurai@marvell.com>
Subject: Re: [PATCH v6 1/4] i2c: thunderx: Clock divisor logic changes
Message-ID: <qc4z3b3t3nilx7kgppxai2ejaiessusdosydtuq42hnnngplwj@5wn4gfpr5noj>
References: <20240402134018.2686919-1-pmalgujar@marvell.com>
 <20240402134018.2686919-2-pmalgujar@marvell.com>
 <DM4PR18MB42069B6DDD0316FACC436D2EA3082@DM4PR18MB4206.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR18MB42069B6DDD0316FACC436D2EA3082@DM4PR18MB4206.namprd18.prod.outlook.com>

Hi Piyush,

On Tue, Apr 16, 2024 at 01:08:25PM +0000, Piyush Malgujar wrote:
> We have updated these patches as per the comments, hoping
> you could review them.

sorry, this slipped off my review list. From now on I will
prioritize it.

Andi

