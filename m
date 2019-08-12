Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A8989825
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfHLHrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:47:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46218 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfHLHrL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:47:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so103703389wru.13
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dd4nFK3Yasv23+PU/7sIWKW7tGXmGUSqsPun5TNRCtA=;
        b=SdCHx2C+pEDytZ1qdooynzwh/T51cGNO3ky/zsAwJLoj+wJhSm3rpWXCnRkDElus72
         N59FxRwjKVmfSqanlMp+PDvD6BVevCzTcHP0yEh0rh232/hUXRuuZ0jYYGDFln+HvCnU
         SNzJdOQz8enkWPoKwwXXpthKUOrU77Hn0jYjkWgQKD2I+2Wd6oW6Hwnbtukgws6SbPq9
         Z0iG6BdSFj3ha0fJAy6DZfaeOSIsDYfNNVwXzzplEICC9yMIQVnygSZRqdb+9VpxqVGo
         9LYMBqF084pjkPrlaM/2PSv7yGuLy2gcWaBcEdUhkWfA+DedYBzzMB1gW99ZoWfXeVoQ
         35rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dd4nFK3Yasv23+PU/7sIWKW7tGXmGUSqsPun5TNRCtA=;
        b=NoK4rRFrqr6jWXn2AWFbfnfA+wqR504sJ7ioSyzSETVcye8Oi72xtgxZgQiBClfld5
         iBMR28d3QUDxABRV2k9psr+c3e21Xpz4wtoW3usn9fh53ZuyynqqsA1NMiz0fHRmpJEi
         lfk6VSsKpjcLoPSE0L9T/SVlOMxtEgKsPt3nwOTnyh+CcjYf38MG3IywRG10REcHGqef
         Op4Q2NiXCWIDL9LkXtASh4Y7FhLnktQnMNFNfjg3D8JU9tXfKhf9A0M0tyJdVAwoL5HB
         KdIckoygmgYEnlSZr45lIsR8uTi4aaqELDMx8iGGz8NzUjXbaG1BMsVe8kEL4E36tbO7
         JjKA==
X-Gm-Message-State: APjAAAWZgbsRd1BPu2rISFM57ScfSkyAGoEwiP8VT0bclYBwhOf/UBH/
        kxvQ+Rvo43jAvHBO0kwx4bgtI9YIfmM=
X-Google-Smtp-Source: APXvYqy8RgVPs2t5iiIzN0JNIMR+Fhmp592y0kdooAnhBgBnKD4Szo7TlxQlSrIpnDaKJzWlaHFWNA==
X-Received: by 2002:adf:f30e:: with SMTP id i14mr7791628wro.288.1565596029972;
        Mon, 12 Aug 2019 00:47:09 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id o9sm9016887wrm.88.2019.08.12.00.47.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:09 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:08 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Support Opensource <support.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] mfd: da9150-core: convert to i2c_new_dummy_device
Message-ID: <20190812074708.GW4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-6-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/mfd/da9150-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
