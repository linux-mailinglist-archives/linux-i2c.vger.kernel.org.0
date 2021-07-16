Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E965B3CBC5C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 21:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhGPTXX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jul 2021 15:23:23 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:39583 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhGPTXW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jul 2021 15:23:22 -0400
Received: by mail-io1-f52.google.com with SMTP id w22so3715189ioc.6;
        Fri, 16 Jul 2021 12:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/5gOwBuOwsfoUZ6rpOSlFriyvvrJOt8bfXg8bMgJgqA=;
        b=BYDNA2jVfLjh9GXG4iaRu40RMBv7lnaFC4uUivDdx/6pzeTJBpZ8cAnL9xPQlTZDmc
         Ca/+a6Bfo836V02NK/6eeaEvOxldCnw4ssBrn+9No4nVujktzkF1n0ZB/kZ2OclvTmpI
         EtC3p6O1mUkKtQ9VG69fqyhoG0t+FaFQhZxtQl5J06kyxoxbzK8R0I3zcuTDitXjhQrU
         0P+cYcHelnWz8lBxhY2zZ6OPCtNEpO+9MsqADv6BNJrRdckUxfFaQOszCA0ZLLP5eZ5x
         DxRoXc47zhOhzB8Ygrg2aUSOzMa6vUDDcAgFWbuMQZG8ckqoShCJrEE4wD3CWa4LCUY2
         ahtw==
X-Gm-Message-State: AOAM530bKLj5sZOgRalcyBH3BCW+RmbgnY+J4PX+2hn5NkA7ErFuzmRD
        6RdUMNWeq6dTCxvna+SAug==
X-Google-Smtp-Source: ABdhPJzeD3J4OE8pllrCy02WyDTNcjn513PSGaytgqhJJvDwUJ2z77wG+/zjK73L4OZmC2HTrlUJkQ==
X-Received: by 2002:a02:a98d:: with SMTP id q13mr10166905jam.124.1626463226407;
        Fri, 16 Jul 2021 12:20:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b21sm5727788iot.35.2021.07.16.12.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:20:25 -0700 (PDT)
Received: (nullmailer pid 3831710 invoked by uid 1000);
        Fri, 16 Jul 2021 19:20:24 -0000
Date:   Fri, 16 Jul 2021 13:20:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH/RFC 4/4] dt-bindings: i2c: renesas,riic: Make
 interrupt-names required
Message-ID: <20210716192024.GA3831653@robh.at.kernel.org>
References: <cover.1626267422.git.geert+renesas@glider.be>
 <da8d1973dcd419d8d9c8c662ee614952f3a6969e.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da8d1973dcd419d8d9c8c662ee614952f3a6969e.1626267422.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 14 Jul 2021 15:20:03 +0200, Geert Uytterhoeven wrote:
> Now the I2C device nodes in all DTS files have gained "interrupt-names"
> properties, the "interrupt-names" property can be made required.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
