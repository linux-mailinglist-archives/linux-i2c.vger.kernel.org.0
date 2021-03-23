Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764733469AF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 21:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhCWURI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 16:17:08 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:33313 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhCWUQ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 16:16:56 -0400
Received: by mail-io1-f54.google.com with SMTP id n198so19105831iod.0;
        Tue, 23 Mar 2021 13:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1j8kGtoUQfseUwnDLVw50cgb9xrn2aTuK5d8pgx2u2M=;
        b=pd9ynP03rEopv+8XXFbKQJapgteyx0f863sDx8rUESsZoV1ZtFAAQykZWQkk/681ac
         Gj/1OQRmog/aLMtVXSz6R4d6vd6IvjCji3ISL1xa8ZzE6Y8bzQYBNpni2+RkJrfU8wX5
         nsvn/PMiEXtU1NYL+Gps97JD7DiRYDOOGtYQUXI/+btypvQn4NfngA/FmxtF/M2lyh66
         0/8jsvBwfXYg2tNopMxnEqi491OHvVK3k8lstLj0cO8LmTQEVW8R+7Lt0ZqLYkOVzqmK
         n8qLvjZ7ugwnFjTok0/5vwNmppZVMSaCy7GOgawHID1aHvFoiZ45FVdLEzyycZXScrz5
         yoiQ==
X-Gm-Message-State: AOAM533I+Qy3q98yXKuNAlNfOtIMAd+jSLOj2toNcFYsxerDh4OVoY8K
        SmpZvz+uHuHDVcuoS/KufA==
X-Google-Smtp-Source: ABdhPJzvec4H0WE9VzYEPuEyT4XGyKXjkOQpFHtGQ2GXQqoNh0Si9ptOh8gUJkx5LVJi13EgDQuoMg==
X-Received: by 2002:a05:6638:d47:: with SMTP id d7mr6254564jak.2.1616530615703;
        Tue, 23 Mar 2021 13:16:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z10sm122287ilm.19.2021.03.23.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 13:16:55 -0700 (PDT)
Received: (nullmailer pid 1244765 invoked by uid 1000);
        Tue, 23 Mar 2021 20:16:47 -0000
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, robh+dt@kernel.org, linux@roeck-us.net,
        wsa@kernel.org, jdelvare@suse.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz> <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Date:   Tue, 23 Mar 2021 14:16:47 -0600
Message-Id: <1616530607.398955.1244764.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 23 Mar 2021 17:33:27 +1300, Chris Packham wrote:
> Convert i2c-mpc to YAML.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../devicetree/bindings/i2c/i2c-mpc.txt       | 62 ------------
>  .../devicetree/bindings/i2c/i2c-mpc.yaml      | 99 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/i2c-mpc.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/i2c/i2c-mpc.yaml:20:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1457053

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

