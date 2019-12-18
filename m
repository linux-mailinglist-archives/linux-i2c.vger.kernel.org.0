Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E54A124A0E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 15:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfLROrm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 09:47:42 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44153 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbfLROrm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Dec 2019 09:47:42 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so218297otj.11;
        Wed, 18 Dec 2019 06:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9JLTGSjx4epFr9aJly8qsWvTUxLCwGGxHdvswveyO1o=;
        b=rsAvp+yKTGugxZc2WYD8VZ6TSvKHtw9pdsZ64u31zyPrsboN0yblRmp7H/+7RuA/eC
         SWfqFZTpdKNU1Kan2o94U9Of/9TOcmxpDwm9mO6GPKdE7aPQ5CbwohsJl1j5Ob6qnUnO
         GqCteXOeo3WYtp/xG3ymC8cOO1XHcQs8YySZKZF3sXo1R5uyl0embVTWuJXiYwD9nx4b
         E2GuMiHRRA4Si5YXsTITF3nLcZw1kXAJuwo9vF7Ui9gBXpI+pgm7UO0VM4UspDp7p9/p
         g4LUkcbwzr9pWqIVIqdLJtrhYm+nSf9SrPGDupF9z0b6NQNBj45LXDTC0yMX0/d1bvez
         quMg==
X-Gm-Message-State: APjAAAXybFqL6kIkRtgpHDgtoK3OMixR/gIqhkQPRZayesPA9rBYz1wW
        28r9pS6z24C2Asx7GQbkBg==
X-Google-Smtp-Source: APXvYqwz2Qbm5BCFt7CSQBZ32REd/5ribF2PL6nZT2AkT0pFaXNiiZxHyy54+Ws+UndhfTHOCoJ+nA==
X-Received: by 2002:a9d:798e:: with SMTP id h14mr2880229otm.257.1576680461033;
        Wed, 18 Dec 2019 06:47:41 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c7sm844612otm.63.2019.12.18.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:47:39 -0800 (PST)
Date:   Wed, 18 Dec 2019 08:47:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH v9 2/4] dt-binding: i2c: add bus-supply property
Message-ID: <20191218144738.GA1265@bogus>
References: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
 <20191216080445.8747-3-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216080445.8747-3-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 16 Dec 2019 16:04:43 +0800, Bibby Hsieh wrote:
> In some platforms, they disable the power-supply of i2c due
> to power consumption reduction. This patch add bus-supply property.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
