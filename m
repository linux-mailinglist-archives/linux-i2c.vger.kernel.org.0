Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF6834EBDD
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 17:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhC3PO3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 11:14:29 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:45683 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhC3POE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 11:14:04 -0400
Received: by mail-ot1-f41.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so15873879oty.12;
        Tue, 30 Mar 2021 08:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iwhcIZMLNXKMYK584OajTswbx7/K7IxB76OYbkncdKE=;
        b=V3R2U+BvTnFje6xcZ3YRqTl7IigoqE/DoaiUgFXH+WCUtk9CgUgUDBuZeOEbyoLiNj
         O2Lk0u9ODpsidUyN01iIfOLXxOuKa/8l9+rLAApxc9AAATtukvOP8L+LuM86MqwXMKlP
         s8Bmm/lR8rhvvCL+WZM++GbtK+1CMEgdpwxel51N09KvEVMdIfMP6OzsAsKhBdvQ765k
         PmlS4pJu+sxfaFsCNiziiczRTtF47tWDNMWWTzswQmrCI9QgPJkswThaAJkUI4i8pdr9
         e/jkVIoeQCrpYBdBjRV8FefUw5B/lwMTHiD6O16E3V9HtbF+ZcXOMXJwQTWagCyg61DC
         UHsw==
X-Gm-Message-State: AOAM5304NdBVi/octaJye4NqgJPQFkXJAIlJf1nVnBWd6k8otM4gaor9
        8gkDICdGcDVQ/XMDX0S77pkz3xJCNg==
X-Google-Smtp-Source: ABdhPJwgVoIpPYH8wn8FHFtcTCwh9gjC6lA9kYPlBExGY8civWtgJdiBj51UikxqYjj4EpyHED5u8Q==
X-Received: by 2002:a9d:67c2:: with SMTP id c2mr27944292otn.343.1617117244074;
        Tue, 30 Mar 2021 08:14:04 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.136])
        by smtp.gmail.com with ESMTPSA id o63sm5103331ota.6.2021.03.30.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 08:14:02 -0700 (PDT)
Received: (nullmailer pid 320627 invoked by uid 1000);
        Tue, 30 Mar 2021 15:13:59 -0000
Date:   Tue, 30 Mar 2021 10:13:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux@roeck-us.net,
        linux-kernel@vger.kernel.org, jdelvare@suse.com, wsa@kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c-mpc: Document interrupt property
 as required
Message-ID: <20210330151359.GA320499@robh.at.kernel.org>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329015206.17437-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 29 Mar 2021 14:52:01 +1300, Chris Packham wrote:
> All of the in-tree device-trees that use the one of the compatible
> strings from i2c-mpc.c supply an interrupts property. Make this property
> mandatory to aid refactoring the driver.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
