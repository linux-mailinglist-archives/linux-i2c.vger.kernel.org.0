Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD8021DAD7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 17:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgGMPxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 11:53:43 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39412 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMPxn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 11:53:43 -0400
Received: by mail-il1-f193.google.com with SMTP id k6so11584955ili.6;
        Mon, 13 Jul 2020 08:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Eh4Jfvrxh30JZFN3zn23LE73ofmFxJNLzHKS7kQqIek=;
        b=l2XTiYD3r8qp40qVgfYfu0vcGBXeZdile/zE5WwZ+Rtz83grzu4RntFCmg8XmUVVuR
         YT9HU4GtbOdPlzC36nvn9uP5GlsbTshYsuwuPKDw7LiRSBh5TajTIb9XUTjTG0j1RjPI
         wh6EaL5bnb1kfgLE7ebhoVMRUl5ysrU1KEi16KS4EsCRNZCIMkZg3VdvlYO8dK2zOTHU
         6HQYsbg6/lAvcBW7oG/O0dYbhnZbRmbPxAGYP0OP/j1YwB/6y1s7FweA6ZSV/IgmzDDG
         Wr7+LY4WNfwHvJ9AWbWr4nHk5aBwLXVf8m+4N9UESh4qsKqph6zUx6WmPKst5IsNTrxk
         5iBw==
X-Gm-Message-State: AOAM533BMiXQuy1ZLqVj35e1UeHpreHFtJLgn+oG3HSXibZ72ZRT0eE4
        X9KT9WtmLrQkj2BN1guEZHLqp6FKIg==
X-Google-Smtp-Source: ABdhPJyV4byNLhAzfeoSE8G8Ux0T5S28B1WJxkW/WZA5EOdpvd7G0QJkWVDjwUUnAWoAG2O11jIljw==
X-Received: by 2002:a92:408c:: with SMTP id d12mr328781ill.304.1594655622798;
        Mon, 13 Jul 2020 08:53:42 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p124sm7776210iod.32.2020.07.13.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:53:42 -0700 (PDT)
Received: (nullmailer pid 282784 invoked by uid 1000);
        Mon, 13 Jul 2020 15:53:41 -0000
Date:   Mon, 13 Jul 2020 09:53:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     tiny.windzz@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, gregory.clement@bootlin.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 13/16] dt-bindings: i2c: mv64xxx: Add compatible for
 the A100 i2c node.
Message-ID: <20200713155341.GA282731@bogus>
References: <20200713022049.22555-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713022049.22555-1-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 13 Jul 2020 10:20:49 +0800, Frank Lee wrote:
> Allwinner A100 have a mv64xxx i2c interface available to be used.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
