Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B602E31F7
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Dec 2020 17:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgL0Q5H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Dec 2020 11:57:07 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36646 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgL0Q5G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Dec 2020 11:57:06 -0500
Received: by mail-oi1-f175.google.com with SMTP id 9so9379455oiq.3;
        Sun, 27 Dec 2020 08:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=EOlAg2v9iu08C98UhOwCODLFZ1ENz3Eke06f2dm8E8Q=;
        b=V9G/MNhR0GCv5YS8CBQJzxhszjVGf//dtuA/WEd39j8f+srC7DlhFqXxxbvNinnZUJ
         UYhZcWHyvdLavPsq2Rz2+HCOUxWRhVR1cFlzyvSlZMIBsMkCWXVZcztnHK5EyvaAB7ur
         8Y87/glYS3a6+cAFy8dL9QZYtdequQtQkOkqpX7IR+BhKBmWWeKNPSjtcgFJu0MpUg0k
         1BmCK/dri1NnxBiWFGA33zz9oScbOfhzKjjU0EHgKZVsofs5mgu3dKIZJ4qjrua03lKP
         gDDttksrUvHhh2yGNZ9EYOjj7UYc/l6wLvUtXT2i+IGQtSPZMRfuFIV8vbK9s+LFmrN9
         hrCg==
X-Gm-Message-State: AOAM5302atC1dfMtkvxp15iYQx3PI+I2UwK5TI5OxSiirSUw5u2swp7L
        XJ6hVOh5UghU3lkWpxWdnw==
X-Google-Smtp-Source: ABdhPJyckCpwAtFyTjFjt97XOEQbjKZxOtNJYxYJDg96ts7gNmBlDpmT7nLsm27Xs+98jptq7Q72uQ==
X-Received: by 2002:aca:c1d6:: with SMTP id r205mr9858213oif.37.1609088185709;
        Sun, 27 Dec 2020 08:56:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w5sm8209515oow.7.2020.12.27.08.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 08:56:24 -0800 (PST)
Received: (nullmailer pid 1338169 invoked by uid 1000);
        Sun, 27 Dec 2020 16:56:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     akashast@codeaurora.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, wsa@kernel.org, ulf.hansson@linaro.org,
        parashar@codeaurora.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        agross@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        mka@chromium.org, rnayak@codeaurora.org, swboyd@chromium.org,
        devicetree@vger.kernel.org, msavaliy@qti.qualcomm.com
In-Reply-To: <20201224111210.1214-2-rojay@codeaurora.org>
References: <20201224111210.1214-1-rojay@codeaurora.org> <20201224111210.1214-2-rojay@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce 'assigned-performance-states' property
Date:   Sun, 27 Dec 2020 09:56:21 -0700
Message-Id: <1609088181.474070.1338168.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 24 Dec 2020 16:42:08 +0530, Roja Rani Yarubandi wrote:
> While most devices within power-domains which support performance states,
> scale the performance state dynamically, some devices might want to
> set a static/default performance state while the device is active.
> These devices typically would also run off a fixed clock and not support
> dynamically scaling the device's performance, also known as DVFS
> techniques.
> 
> Add a property 'assigned-performance-states' which client devices can
> use to set this default performance state on their power-domains.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/power-domain.yaml:72:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1420485

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

