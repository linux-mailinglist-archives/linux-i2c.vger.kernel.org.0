Return-Path: <linux-i2c+bounces-3068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F08AE55F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5CEE286FA9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BEC84A43;
	Tue, 23 Apr 2024 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufmSqnm0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9181912C480
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713873296; cv=none; b=kMlW/VBUQBdsLPYoX37Mrggu6QT5WGF1fn0vn2EPN3yyB0sJc/0wUciG0vC024ODnu9wxy4f2392bs+Iztgv3H/AaYxK+zd5ZXJMP6ew2BR+o90TIoIs8ORCPfkYuvtUdFrTyyUV+GGI5Suz3D2b/XfczseMn/VMwl1aqj0pGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713873296; c=relaxed/simple;
	bh=60M6MtWd8WoygEaCjJOcyxreg4Y/5Y3FzUvOYfu1rWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btAmnOhjaVHP2xvi8338E78jW3OCeKv9yGSLcft1FfeVljHy7sFt4Y4gZhA984G6w7PNx20JJTAk03rTMtk1kJZvLyv8F/Ssj/mmEuMKiPItHbiwMGix+hDU89ldZvgXayQY07cs7b3kOaAj6xEHIfq3aYSqNIAAbYClmShWVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufmSqnm0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6351C116B1;
	Tue, 23 Apr 2024 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713873296;
	bh=60M6MtWd8WoygEaCjJOcyxreg4Y/5Y3FzUvOYfu1rWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufmSqnm04zwCO4X0a5+anWjdJ/Scc4CCS3x8JzNaobkSPOboAVOtvO3I1PMNCNUIb
	 JzMChBenXetZILOgZpxjTlUkZJh8R10Qclxpuab0QVq6w52nB2tIwWq9eqjGd9aZR3
	 xZ3En4S72obVuCvqVJBb93PeDl3a0Bftzxb9STT+fsrzxUhgr6UlcRBgxqlpjE29UR
	 M4X4ZwQbPDaR8ietVOtPivbnFEnSxatzqZhZecvkDyO8kpk5+J6nxtwdoDr4JPm3KV
	 FtRUn0qoKyIQ/macw6w8RyfU3EQB7aalYe9cYN3Z/agcKWxznRsnoJJfm59rBFmiS8
	 JJxrrNtrJ68Cg==
Date: Tue, 23 Apr 2024 13:54:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, wsa@kernel.org, cobechen@zhaoxin.com, 
	hanshu@zhaoxin.com, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v10 3/6] i2c: wmt: rename something
Message-ID: <dkywpjd47rzgq7wxgwssmju64syn4nztina25mxsixz2rtfhh5@uwbiuqpszppp>
References: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
 <51f2d3e750e64a1ccdc7bba4a85fb92a3dd99b90.1712479417.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f2d3e750e64a1ccdc7bba4a85fb92a3dd99b90.1712479417.git.hanshu-oc@zhaoxin.com>

Hi Hans,

On Mon, Apr 08, 2024 at 10:54:45AM +0800, Hans Hu wrote:
> 1. The I2C IP for both wmt and zhaoxin originates from VIA. Rename
>    common registers, functions, and variable names to follow the
>    VIAI2C_ and viai2c_ naming conventions for consistency and clarity.
> 2. rename i2c_dev to i2c, to shorten the length of a line.
> 3. rename wait_result to time_left, make it better to reflect the meaning
>    of the value returned by wait_for_completion_timeout().
> 4. remove TCR_MASTER_WRITE, its value is 0.

next time all the above changes should be on separate patches.

Andi

