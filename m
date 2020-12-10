Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C922D527C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 05:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbgLJED6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 23:03:58 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39752 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731385AbgLJD7p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 22:59:45 -0500
Received: by mail-ot1-f68.google.com with SMTP id d8so3664338otq.6;
        Wed, 09 Dec 2020 19:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xeFPhddnP1lHVDJb4oU9zmV61htXm7Y+iyJ+r1ouWvQ=;
        b=A++rMWnzzQJuIj9Wu+CKNsrc4CWGI4nDMhDU9Wt8BNJFhhA+JwNwaQnRI/40sPMwRS
         DaT2HVZ3NyNYDFMEtydQ62Cgru4VqfKhHKKml+9HUgRSfzfDHSrWNsoG6C45U32RBzIw
         8pouLc4czWn5yY/5bKWfWZGccDW/cxvr/cJ3BikmTcyYf576tpc2Z3qrTcwVQVC+RO73
         o8QVLQ2wlxtMsvhJ18EawmDR199g3TwYC+RexhkSI6vrMpd30txD4An703EU0AcIss/v
         B5lWEtrJJpkyU/5B22s0tHlFVaVm+D1f7SkrmFmQNjwI0bNoWsCg0dgIFNfl0qHSFXCW
         tdqQ==
X-Gm-Message-State: AOAM530kclsl6y7HAqo1UoJbIkb3GKZ4VfQetDzVdQU8UTBj7TwV6OpB
        Dqbnvg58pXhOsocVnfGuzA==
X-Google-Smtp-Source: ABdhPJzRhQS/9Ld+qudfJUjE3uPxTeIvJMVnLcQC301yqBZ/QEQr2oAa3pMetwTnxXwrlAquBnVtSQ==
X-Received: by 2002:a9d:2923:: with SMTP id d32mr4329675otb.117.1607572743776;
        Wed, 09 Dec 2020 19:59:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p3sm842770otf.3.2020.12.09.19.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:59:03 -0800 (PST)
Received: (nullmailer pid 1637499 invoked by uid 1000);
        Thu, 10 Dec 2020 03:59:01 -0000
Date:   Wed, 9 Dec 2020 21:59:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-pwm@vger.kernel.org, broonie@kernel.org,
        gregkh@linuxfoundation.org, linux-spi@vger.kernel.org,
        robh+dt@kernel.org, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org, paul.walmsley@sifive.com,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-riscv@lists.infradead.org, peter@korsgaard.com,
        andrew@lunn.ch, palmer@dabbelt.com, linux-i2c@vger.kernel.org,
        bgolaszewski@baylibre.com, aou@eecs.berkeley.edu,
        thierry.reding@gmail.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: i2c: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035901.GA1637443@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-7-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607403341-57214-7-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 08 Dec 2020 10:25:38 +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
