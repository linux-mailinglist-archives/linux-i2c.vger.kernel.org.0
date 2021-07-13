Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDC53C71C7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 16:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbhGMOGO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 10:06:14 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:37420 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236755AbhGMOGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 10:06:14 -0400
Received: by mail-il1-f178.google.com with SMTP id o8so12465073ilf.4;
        Tue, 13 Jul 2021 07:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rrdiKpMGTcNX/oecvUxIZ+HcSY5J/MLTnT7FsikOG0g=;
        b=Vqzk6pEkNrOEkU2H23Dv6pc9gNWqZNjXAporyytCOv5MABIYkqP7gKCl/h6Reehvdn
         ir5JjbOKgeNLg6V2fKwCB1W1hg4hxsksWD1vmnfyvBWNQPVzr8VQNSlMb7v46NRN/n10
         wbagJJHPjiijkjjeLMwSIGG+Fe7f7cVfrXml2pjJOnGkg+BTxSf2Y4zcMWJfqgo89XQ8
         /7r0PCeSiKsBwYm0HxxplbOSpyyDUHWGyP2qYPYttUtt1xCOGLww2KrcUI9Tzcij3VOF
         ROOp/3Mv5MM3RxRw3yjSvOIkUVGqnmRPx2JodmdFNc4ixOeU+aUSjKJqoFxSwtenRvN5
         5Nbw==
X-Gm-Message-State: AOAM533gBhEVoo7kYUdAkNYQtnBDah97GqDzQniKcdyQ5aDcy7sVM103
        uI1pmdypDmARxQLBDWg6PA==
X-Google-Smtp-Source: ABdhPJzonXO+4ZfWz8P78P+ikyRaaY9YHUrrlWmavAu+ibX9HKMQRFdOhnXkLxc2XaT8jK4JxU+Blw==
X-Received: by 2002:a92:a30d:: with SMTP id a13mr3116852ili.236.1626185003183;
        Tue, 13 Jul 2021 07:03:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r16sm4229865iln.30.2021.07.13.07.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 07:03:22 -0700 (PDT)
Received: (nullmailer pid 129713 invoked by uid 1000);
        Tue, 13 Jul 2021 14:03:13 -0000
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>,
        virtualization@lists.linux-foundation.org,
        devicetree@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <e650cecb3bc6a0ed16eb37460ac57cb191ba92e4.1626173013.git.viresh.kumar@linaro.org>
References: <cover.1626173013.git.viresh.kumar@linaro.org> <e650cecb3bc6a0ed16eb37460ac57cb191ba92e4.1626173013.git.viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: i2c: Add bindings for i2c-virtio
Date:   Tue, 13 Jul 2021 08:03:13 -0600
Message-Id: <1626184993.664261.129712.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 13 Jul 2021 16:20:32 +0530, Viresh Kumar wrote:
> i2c-virtio represents a virtio I2C device and this patch adds binding
> for the same. The i2c-virtio subnode can be part of a virtio,mmio node
> and is based on its binding.
> 
> Cc: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-virtio.yaml   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/virtio/mmio.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
Documentation/devicetree/bindings/i2c/i2c-virtio.example.dts:19:18: fatal error: dt-bindings/virtio/virtio_ids.h: No such file or directory
   19 |         #include <dt-bindings/virtio/virtio_ids.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/i2c/i2c-virtio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1504542

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

