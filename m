Return-Path: <linux-i2c+bounces-1086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E4822E47
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 14:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CFA51F222EE
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 13:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354F719BCA;
	Wed,  3 Jan 2024 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXg0F81g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165C19BAF
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C055CC433CA;
	Wed,  3 Jan 2024 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704288553;
	bh=6qnWb28lYLiWpv2t/Hb9uQIHmQt7RxY03IrRsofeexc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXg0F81gU+it1LvwX2Zh4uR5qP66mJ5Up1pVl/GQ6iuXrqxtJ+EKT0su2erPGf6mL
	 RL8T1grY2n4rXfXhv21S3BXGqUVby03GdSssTcugA3lbzlU41B2iUbA3Qab0uPc6ry
	 7A+QPElU8SDxHqjAUO8Rk6ptciIbrr9cPNyzoqwOkOKXeJwllv8xIFud3A+xWa+R04
	 mEQEuNpIcGhPNpihRfwY29fOb8m4g+etKqmGmCT0zvRi8kV8lj+zYiEs0ylGKcxFds
	 b4Iw3rFSsj3SHijPFFgkdssuBaoiLz4HxUOC8+j3d3uA76j+hOfOv7AGsNTVWWlr6F
	 t+s+LPe7X8DVg==
Date: Wed, 3 Jan 2024 14:29:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 2/8] i2c: wmt: rename marcos with prefix WMTI2C_
Message-ID: <20240103132909.tuhh5wroaidwedk5@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <75978a2c47f17bf6871b92803e9c075e52aed1b6.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75978a2c47f17bf6871b92803e9c075e52aed1b6.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

On Fri, Dec 29, 2023 at 02:30:33PM +0800, Hans Hu wrote:
> Tweaked a few formatting things: rename marcos with prefix WMTI2C_

You say "a few" but then list only one.

> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

looks correct, though:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

