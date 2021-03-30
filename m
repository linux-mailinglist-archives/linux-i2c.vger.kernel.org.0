Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9267834EBF9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 17:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhC3PSs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 11:18:48 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38653 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhC3PSX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 11:18:23 -0400
Received: by mail-ot1-f49.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so15912641otk.5;
        Tue, 30 Mar 2021 08:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PlZUNayRrmgaKgXVXtAL3PXk2F0oj39eu7kyoW5Ud/k=;
        b=r6rHI1zJ+r6SgfV0txfGJp9CJp6K2NSmEJBQox0vOMTSK6rlH2W/46SyUYpw1kzhso
         vwDWYCaNkIE7H62J8Pivg6buIKM8GlkftOKWE2zQMfmVBesyPHT4/mxflKW1r52iQL7Z
         xwqOk2hRFMKmTXnKNMnssJt0pun1Me21cpDzftsVlXraIigB3eX9R/FYewGZwvVtsQPt
         C/184K8rYICDpSwYHAgKRy1lEQqS0VljNCte7mnNo191QAgomweNwy9yzcLXPAI/BEP3
         XC1EhX9VSJR3xjqef2L7ImxzNVUhMVX/vbjW+2fPa3WcUADZhfSieWfsboi/DRoNORNo
         yqKg==
X-Gm-Message-State: AOAM533b2DTKP8p8A/rx/iF1VxdkSCa/wkynEzuL0mIm88LdyfiM/YWa
        rIfsZvCPV6DhYs8mm14Etw==
X-Google-Smtp-Source: ABdhPJw8DvKlnSSfnVW/ySoAGDIq18w0ithxPe/i7w68DXnVExjOMD2+U4R56xLkHWo3rb9lqExncQ==
X-Received: by 2002:a05:6830:1bf5:: with SMTP id k21mr28157540otb.129.1617117503382;
        Tue, 30 Mar 2021 08:18:23 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.136])
        by smtp.gmail.com with ESMTPSA id h59sm5190376otb.29.2021.03.30.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 08:18:21 -0700 (PDT)
Received: (nullmailer pid 326348 invoked by uid 1000);
        Tue, 30 Mar 2021 15:18:18 -0000
Date:   Tue, 30 Mar 2021 10:18:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, robh+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com
Subject: Re: [PATCH v2 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Message-ID: <20210330151818.GA321862@robh.at.kernel.org>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329015206.17437-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 29 Mar 2021 14:52:02 +1300, Chris Packham wrote:
> Convert i2c-mpc to YAML.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - Rework compatible validation
>     - Remove irrelevant i2ccontrol from example
> 
>  .../devicetree/bindings/i2c/i2c-mpc.txt       | 62 -------------
>  .../devicetree/bindings/i2c/i2c-mpc.yaml      | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
