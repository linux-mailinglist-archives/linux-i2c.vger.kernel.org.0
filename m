Return-Path: <linux-i2c+bounces-1090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02897823322
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 18:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30981F247E9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 17:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE6F1C684;
	Wed,  3 Jan 2024 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxlpvXsQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C91C680
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 17:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49384C433C8;
	Wed,  3 Jan 2024 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704302467;
	bh=Bc0h2ER4Nxi8QQOFQ7aYJ0txr7D1y/aSt68b6FlVxzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxlpvXsQQwx3jIJ16h7pBtWaAlOH7boX/+UwsR7RW5sptRuDxB9EBh33mTDnscrMZ
	 oskjy1Ds3ltifcaQNLjwjWcW737R/9aIO0Z5Si+0kOcY8wobwfS5hxMOXFEYEyxmLf
	 EJKny7mc/S+grFD8duILalcZZkbn833dAkbTIX4pH6WO1jf/qGqBn7JrKxer8j4l7U
	 /Z8atjeLcyFIoPUD9Vjqc0jUKJjuvx4UY3AEeDgYlI7nQBSjvjjhJvB7qpnlvxvSQu
	 zjOBbLQm9Vuzuzb7SJC8uUR90/PK8Kbv5exCbFywMCeQzLzosV0E5/CRg7DWBj/Z6q
	 K0EYpJG43Q1JQ==
Date: Wed, 3 Jan 2024 18:21:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 4/8] i2c: wmt: split out common files
Message-ID: <20240103172103.oyt5piqfpnk5krc4@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

On Fri, Dec 29, 2023 at 02:30:35PM +0800, Hans Hu wrote:
> Since the I2C IP of both wmt and zhaoxin come from VIA,

/come/comes/

> the common driver is named as i2c-viai2c-common.c.
> Old i2c-wmt.c renamed to i2c-wmt-plt.c.
> 
> The MAINTAINERS information will added in patch 0008.

when the patch is applied there is no knowledge anymore of the
patch sequence, please put these comments after the '---' section
or make it generic: "The MAINTAINERS file will be updated
accordingly in upcoming commits"

> 
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> ---
>  MAINTAINERS                            |   2 +-
>  drivers/i2c/busses/Makefile            |   2 +
>  drivers/i2c/busses/i2c-viai2c-common.c | 234 ++++++++++++++
>  drivers/i2c/busses/i2c-viai2c-common.h |  66 ++++
>  drivers/i2c/busses/i2c-wmt-plt.c       | 137 ++++++++

'plt' stands for?

Everything else looks correct.

Andi

