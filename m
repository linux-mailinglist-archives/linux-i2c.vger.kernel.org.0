Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2D3539C03
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 06:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbiFAERp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 00:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbiFAERo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 00:17:44 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA1550010;
        Tue, 31 May 2022 21:17:43 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so4962793pju.1;
        Tue, 31 May 2022 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=o/u+GQMNh/HAcOKl3CZKj/1opnd127HV5unYt41+gbI=;
        b=gnORif3Tpzt3B3qkKnNDkan4+1Zfo4v4jceA3/xRP7EuZGLzL6fIgFLxSezG+RjFix
         PXLDQIxh56zWN2y4QzD1Q4LpD39iErA3AvKF874hsa/RnPyrEwCBH5VkHuE/jAaQM9bt
         gR5TzF9COueiSqhm2MGTkIz2TyxozaukKm6tbXpKA5zqB+s1aIH2bBvJPQKgbgpQqJ2i
         4RjyVWEHXtIF62jSHUdLkbHHbNPEqXiUOeJ2AgNGB5o0tuMa7KgYpyma+QF+S/KPD8ZU
         CSyFXYku6245mQeQQMnbxjfli3vMAYnE6dN9UopmI3h8EiobA+m+UhTDcLvOQe0GUrBc
         taYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=o/u+GQMNh/HAcOKl3CZKj/1opnd127HV5unYt41+gbI=;
        b=GYg5SwN6iAxpgrB4LsVntgR0mdFXVNlJJp4Rw5gG1nICo6r1+pT3CxLslPkGa0yWQn
         Mx1Wjs7mdUG5INurSlq88d4ricl/ObKrLRBjazmXaUv4frxazbqxZJDePGOv3wtwTiTd
         HEQZsdkpJx2iwPB7IQ2OQYlKr1EDqKrQYfOGzv+o35HXbVRxyhCr3SOvc8GZcIpkQzTx
         Px66d5BCB5m17rAQKyIUVA6rAG18igO2zZZ1isV2Cyz6SEOFoGupVItlFsyPkK2nY8dV
         jGmiouMfiDI34wQTcKDda16UafL5KvGIxFBZwS0jzHVbiIHmASgs+VExYMV9bZgVzk/Q
         bnOg==
X-Gm-Message-State: AOAM530FsYKUx48cFotICd4gMONFtChJMFqH8O0nHi6FvRlFDCjwFTuH
        ke7ynb9ahHEuLaa5Gx7ejI0=
X-Google-Smtp-Source: ABdhPJyMfMNtPn/D13pgx8ooxUQkCNfMvFyZXZjYayYzm8HCzqrk4SeQsJCDASAy3EEwakR32Lzm2A==
X-Received: by 2002:a17:90a:b797:b0:1e0:ad13:ef39 with SMTP id m23-20020a17090ab79700b001e0ad13ef39mr32233871pjr.8.1654057062682;
        Tue, 31 May 2022 21:17:42 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id u11-20020a63d34b000000b003c14af505f6sm290749pgi.14.2022.05.31.21.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 21:17:42 -0700 (PDT)
From:   Potin Lai <potin.lai.pt@gmail.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] Add i2c clock manual tuning feature for aspeed-i2c driver
Date:   Wed,  1 Jun 2022 12:15:10 +0800
Message-Id: <20220601041512.21484-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Current aspeed-i2c driver could calculate a suited clock divisor and
high/low cycles automatically, and it try to assign high/low periods with
close number of cycles.

Because of board schematic design, sometimes we need to manual tune i2c
clock timing register to get longer high clock cycle to match hardware 
requirement, which is not supportted in current driver.

In this patch series, we add new properties for manually assigning clock
divisor, high clock cycles and low clock cycles.

LINK: [v1] https://lore.kernel.org/all/20220530114056.8722-1-potin.lai.pt@gmail.com/

changes v1 --> v2:
* update bt-bindings documentation
* use meaningful values for properties instead of acture value in register

Potin Lai (1):
  aspeed: i2c: add manual clock setting feature

Potin Lai (1):
  dt-bindings: aspeed-i2c: add properties for manual clock setting

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 ++++++++++++++
 drivers/i2c/busses/i2c-aspeed.c               | 57 ++++++++++++++++++-
 2 files changed, 100 insertions(+), 1 deletion(-)

-- 
2.17.1

