Return-Path: <linux-i2c+bounces-1094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F2823606
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 21:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12781F256E5
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 20:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1AA1CFAE;
	Wed,  3 Jan 2024 20:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHmrzz2z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731A1CFA0
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 20:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF39C433C8;
	Wed,  3 Jan 2024 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704312185;
	bh=gLSTnfXYUmBfmbsyh8NrjO3G/0KuuUETccIMrmMPDgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHmrzz2znGD+kSEYCDD8BDvqd4xvasTkWhUdPXL4TwbEcIJQrM+Q0QHOYNSK0d+3p
	 sX4cFNqtQTksRoaRJs8cn/fnvQf3suw3HzW+Ldvigj4CtM6QaXwELo8H+u5qm9oxgV
	 Co0A8Sjq7McEYldYEpreny494++O1KZXPCHQtPFGBelA5S1PnRVj3bUqqJewrEBekO
	 q1xGy6vNDeVD8u5N1VVM6AXVyoiDqirG04bvsToxPEt+10PuKvMppdu0FmOdf2U35W
	 iIst8/QRCpO8p5B3KtKWVK14yT0EZPfDT7/Qm/3xVcuX8jD4KLjnMuUvsbD/4aMe4p
	 v6MSL+yPECkSQ==
Date: Wed, 3 Jan 2024 21:03:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 0/8] i2c: add zhaoxin i2c controller driver
Message-ID: <20240103200301.mqbtwlfxwlmly3i6@zenone.zhora.eu>
References: <cover.1703733126.git.hanshu-oc@zhaoxin.com>
 <cover.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

On Fri, Dec 29, 2023 at 02:30:31PM +0800, Hans Hu wrote:
> v5->v6:
> 	fix build warnning reported by kernel test robot
> v4->v5:
> 	fix some build errors.

Where is the full log?

Andi

