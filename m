Return-Path: <linux-i2c+bounces-1394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5A8358D1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 00:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6440D28237A
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Jan 2024 23:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D10B38FAA;
	Sun, 21 Jan 2024 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1kw2A1M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1091EB52
	for <linux-i2c@vger.kernel.org>; Sun, 21 Jan 2024 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705881366; cv=none; b=o+WR0c0d8k3NMmHBFNsInnCcTCJqKQnDVNRs/yBLh6aGRGRCXlw1SLg8B4vlLVv5fucHfUksQgtQSRn994IU/z98d7usTeBzhvMHjh4ElU2+M+FPe/i8zT6ZxL/3pc8hkXa0gx7noPUUq07Y/SXpxsJyvNpcWWRKRg9DsrpyJHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705881366; c=relaxed/simple;
	bh=FX4MlOokdtbSWj3k54f/wqjq5OfXY72DGpdj5JZWi+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLDVkRN0t0uL2Hn/Q2ibmiS/0yKRlFA8tSb0qpcHWRsySfUKZ48XquriKjjXsHhXv0GPjWJfPhPCJO5lYf4pdnqPaRbG8YUvI0csZtw5fvKBEwHMnDo8AARdeklDZq9pCzC0PMpMmBBbWBv/QXtg3ykM3w4g/NR5DX6h4xm0DQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1kw2A1M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BA7C433F1;
	Sun, 21 Jan 2024 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705881365;
	bh=FX4MlOokdtbSWj3k54f/wqjq5OfXY72DGpdj5JZWi+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1kw2A1M/IvcraQ30xqD3T5Q0zFfTWk4P4faOlP0pc5FYCu5kcbM2MTICspbAlyHB
	 u9x7cGSRM6ebF7Y2S1NADP0QvJK2pob2m7UHkRW8w/mfjxgOsrLN97cBY/i+WX9R3/
	 HjXXO6YLk5O/mPErqRP5BkEHnVyWh2j82x2Kw/FLl96H3sZmlgJHcKAPlNMIBz6oVz
	 VBbyCqkDsLAXKf7lvDAaZothakoXB4bOhoHFIDkwMNkQ83nruQ9e1TDnOLvFhGJ1d3
	 2wrilriWPEhHixdbz03agEf9RKa5eAJeyjkTykY3TtiKPkhAWDxrpmEmgX/wcdLKnF
	 HTkDz4ttJFoUQ==
Date: Mon, 22 Jan 2024 00:56:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, 
	wsa@kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 1/6] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <oojh27g4xjregx63lkwqsacukwcxjsijhkmt4b2f6vr66rdysu@umtb7eglyp72>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <eb2249f78697bd295d720c14501554a37ab65132.1704440251.git.hanshu-oc@zhaoxin.com>
 <4237903b-4cf2-47d7-8305-624925941126@kernel.org>
 <122cd611-bb11-4092-b466-9e3cf4d81492@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <122cd611-bb11-4092-b466-9e3cf4d81492@zhaoxin.com>

Hi Hans,

> > On 05/01/2024 08:51, Hans Hu wrote:
> > > v5->v7:
> > >        nothing changed.
> > > v4->v5:
> > >        add previous prototype 'static' for wmt_i2c_init().
> > >        Link: https://lore.kernel.org/all/ZYx0VPVmyQhtG+B9@shikoro/1-a.txt
> > Why there is only changelog and no commit msg? Changelog goes usually
> > under ---, especially if it is quite non-informative...
> 
> Commit msg comes after changelog. Yes, I should have put
> commit msg at the beginning. Other patches also have this
> problem. Adjustments will be made at the next submission.

While it can be convenient to include the changelog in each
patch from the reviewers perspective, having it all in patch 0 is
sufficient.

Personally, I'm not in favour of adding the changelog to the
commit log, even though it's a practice common in many
communities. However, I'm open to whatever approach you select, 
provided there is consistency.

If you decide to keep the changelog, consider placing it at the
end of the commit message, right before the tag section.

Andi

