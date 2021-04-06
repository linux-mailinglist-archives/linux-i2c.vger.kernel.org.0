Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0533554FB
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 15:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344404AbhDFNYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 09:24:23 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:42773 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344396AbhDFNYU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 09:24:20 -0400
Received: by mail-ot1-f49.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so14091889otr.9;
        Tue, 06 Apr 2021 06:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=3Z6VfoQf/cVhFTnKPgFjS1QLBhGZOrLUYnwWlVNrobE=;
        b=YNTpEwYxtWvVqJN5ThbmerRtGETpsfijUSV4+uJuzsnZMBaVfuO3pHiAuq0BKV89eC
         SQR6+0ZR5wKsdReuwvwyPna0xQKAsHOKMOS/BAT2sXA7EJOSoNyT2wDug0cVy8OAUE+B
         F+m0Bjg2Q8QIkBhJdw3U9/8cLhMF9ipHBWf38e2lMpHt8lHxAD5L0PMxVvUJQcSMuawx
         LDUmxJWOSKlyVDmebKJyLbruWABpqfaMlAM4uweIg3qnqhqIZkeCxzsAIEYwq/hLWBHm
         wmwnWyNzcqlLJ4P/ADsXIQOx//cK6u/p+laSy7UPhPxd8+A7gjMZj3eMPA3RxsUWBGPF
         KCoQ==
X-Gm-Message-State: AOAM531gHIQS5qPpEBL3yR1ao9E9h9UM8pju5C/Lo/K5EH8gUQ6H15Bs
        W/mhre00tDbv9PL0DolpaQ==
X-Google-Smtp-Source: ABdhPJxUvGiUrGMiWqNC3Ye0jO+bTj11rgCpxHtjebTMf+Kxs23vcd19hfUsQVD5BlolI6tJnJJVZg==
X-Received: by 2002:a9d:f06:: with SMTP id 6mr26373689ott.13.1617715452341;
        Tue, 06 Apr 2021 06:24:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v23sm4677850ots.63.2021.04.06.06.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:24:11 -0700 (PDT)
Received: (nullmailer pid 1674502 invoked by uid 1000);
        Tue, 06 Apr 2021 13:24:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Clark Wang <xiaoning.wang@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org, festevam@gmail.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20210406113306.2633595-12-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com> <20210406113306.2633595-12-xiaoning.wang@nxp.com>
Subject: Re: [PATCH V2 11/18] dt-bindings: i2c: imx-lpi2c: Add bus recovery example
Date:   Tue, 06 Apr 2021 08:24:05 -0500
Message-Id: <1617715445.188566.1674501.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 06 Apr 2021 19:32:59 +0800, Clark Wang wrote:
> Add i2c bus recovery configuration example.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> V2 changes:
>  - New patch added in V2
> ---
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.example.dts:31.37-38 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1462762

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

