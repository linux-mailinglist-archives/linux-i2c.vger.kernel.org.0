Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6D31B194B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 00:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgDTWSF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 18:18:05 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38316 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgDTWSF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 18:18:05 -0400
Received: by mail-oi1-f196.google.com with SMTP id r66so10312677oie.5;
        Mon, 20 Apr 2020 15:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rkRZS5DS4nHwvUbyrOz6+6YEYG773x2tAPTyB5Eyop8=;
        b=g24DtuahPUXqzD2r+Ih5RWs4Hpm+l410Kxh/SMAqOq3k52AhD9vw3EMwMe39RNU5K5
         i7BpOI/zFCnnoxfr0Q0Z13NH7hVYIUMqPYOyF0zB0KJnZPg9lv+0AmTCYzB9DMfkjZ+t
         DB/LHcJ/lh4+AvIba0pVrJqyCs73JcvZegzC8el0fSnVefltrEYbB+OCQT/n280qpXM8
         IcmY/XUHymCs3J9ONs5le4QMRUQ2+3zZuQbpRUrpCuhDmG2KXvN5nedDwQiHtmaiID9N
         gWn2pvuXl5JZKcvm6eOasBHQR2CPOpJGaajhzLHkdREWe9VOZL5cpTVasfA6mqeexkGS
         1Dig==
X-Gm-Message-State: AGi0Pub1BGw7vcthdN4tmJz7GQaQEihsnzSanVF6doKWQjd2NQxZLCsO
        SOw7KVdHgi8rEIVidiEWka5qx+k=
X-Google-Smtp-Source: APiQypIo7EUO06qxsuKNykV+xG2tPvmPoJlJrN7Yxnus9RzR9ZKCj+pPPs+lzgkeiLOKBPeOAMchgw==
X-Received: by 2002:aca:f384:: with SMTP id r126mr1131185oih.41.1587421084583;
        Mon, 20 Apr 2020 15:18:04 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 76sm249798otg.68.2020.04.20.15.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 15:18:03 -0700 (PDT)
Received: (nullmailer pid 30960 invoked by uid 1000);
        Mon, 20 Apr 2020 22:18:02 -0000
Date:   Mon, 20 Apr 2020 17:18:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] i2c: regroup documentation of bindings
Message-ID: <20200420221802.GA30899@bogus>
References: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 15 Apr 2020 12:51:00 +0200, Wolfram Sang wrote:
> Some bindings are for the bus master, some are for the slaves.
> Regroup them and give them seperate headings to make it clear.
> Also, remove references to "generic names" which is for nodes and not
> for compatibles.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 66 +++++++++++--------
>  1 file changed, 39 insertions(+), 27 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
