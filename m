Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7730B497284
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jan 2022 16:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237583AbiAWP3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jan 2022 10:29:05 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:34391 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237573AbiAWP3F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jan 2022 10:29:05 -0500
Received: by mail-ot1-f42.google.com with SMTP id m8-20020a9d4c88000000b00592bae7944bso18822889otf.1;
        Sun, 23 Jan 2022 07:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/c1j0fg99uD/B38L/tInQcHANZpluiK4u1HRJlmQQGI=;
        b=SXx7VLLX5AEYI+4QDI9i8dgjjkwYslQKSp16ciZhSC4Lrv5cRiFjAMazaBEANK9Gkp
         Ovq7ng8/VhYakuJ8Gfne7ou5ETgrShH33BB/nYaBcEkaSCzAY27cyPKB6cj76Q4XvwOe
         cmq14bfjAmFTqMAXQdObtSL+2D4V0ESNJXkH3c/zd2GcksiAuqv7Q7HpkrqkOKbQZqtp
         WIsPugCLlJipqAIDvovFIb7rmi7Y9hTQBGsZgF793hzaPdZsh2BO42E1MATihOTv+G+q
         Dx6Pn+BTrjxcM3C/yc11gvCzMBpJO7iyOgNKjUVr5CRzlc6AgCcbpLCqsZEaTZ0EUl9z
         /cnA==
X-Gm-Message-State: AOAM530y0xGp4hXXzVAMqdSz5JuJ6xQyJjwde4Ax7X6mUDwcfhvSIX9y
        46K0yPy76RQVukP9qsVR2A==
X-Google-Smtp-Source: ABdhPJyjAPiiDh0sizp/c/0tSKvBUcIXWHz3iWLop//vFxT98EGZPiwyxU4l4guTFOeyotiEWfaTIQ==
X-Received: by 2002:a9d:7388:: with SMTP id j8mr3340251otk.180.1642951744989;
        Sun, 23 Jan 2022 07:29:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g2sm3709240oic.40.2022.01.23.07.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 07:29:04 -0800 (PST)
Received: (nullmailer pid 1428763 invoked by uid 1000);
        Sun, 23 Jan 2022 15:29:03 -0000
Date:   Sun, 23 Jan 2022 09:29:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        devicetree@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH] dt-bindings: i2c: stm32-i2c: Move st,syscfg-fmp
 definition to top level
Message-ID: <Ye10P+FlVPzsB7jR@robh.at.kernel.org>
References: <20220119174407.3810088-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119174407.3810088-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 Jan 2022 11:44:07 -0600, Rob Herring wrote:
> It is preferred to define all properties in the main schema and leave
> if/then/else schemas to just be further constraints on properties.
> 
> Rework the schema to use be more specific for each cell. Previously,
> multiple entries of 3 cells each was allowed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 24 ++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 

Applied, thanks!
