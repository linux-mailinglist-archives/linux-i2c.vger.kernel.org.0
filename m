Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AE45403E6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 18:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344019AbiFGQjg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 12:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345085AbiFGQjf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 12:39:35 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB32AC8BD1;
        Tue,  7 Jun 2022 09:39:34 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id q18so15238708pln.12;
        Tue, 07 Jun 2022 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=MMsXwp0wncXVlQhEOdDSIGnh/k5pLZa/8LV3fqGCk4Y=;
        b=KIKbOB4wieeuMpPaO4+32G+4O/nY09/u19Hqx4jPcpRklBIHv2pGAdhO1sQC919tqD
         NDH4+9zXCSW0mRmdCh/7PSXshbx4o0PDMEieI3ug6oYly+Y6IHZoreB1ONVcYCRJhWvF
         SR6PP+uhXWFry/W5JVfWBl5xTF6wXJcMIt76Nt3bkIKvt8VBhN29upjxcjONcAn9QLE+
         lWjCZ1G826QU7OO3kpgh8vE/sigSZehnXmu/DXLREfk1V5buNv4/PBT35ez61pRAom3D
         RteKFqjdRcjWzcMLhx2XeHk656GOqb+/22zVFV4ZOfAL82uPf+DTqpzmWMjV7cMNI9p2
         LJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MMsXwp0wncXVlQhEOdDSIGnh/k5pLZa/8LV3fqGCk4Y=;
        b=dEBIwXPPHY4aRRIKg04ep5vXTBHJkgSZIOS9zYMlAanM1zGcyiPkLBWo7LXc+Tl/Cu
         8YQJBIBl0SKmNYVCTL6N2Ixor/ie7/RFky+DhpqKuWkeN1gt0g8aZwGOkZdGwr01RgL7
         gzCY+dkQbXyuNmIF9GETnz1R3Prm8tJs2idkizTvtyYmcxQf4H21Vu8U9EwbmXq3SCVN
         AQ3FlY1XevRobbOZ6xxMbmmu8Uw4FEgBx5eksrF6103crC/ES4wwvKvL+YLUFHEoLPVs
         8hVWnIsIKAV7mX8AQ89OaE6lWhte+J+3IBaZhmElzud5Uyxh+Nr3vaTgn/dbbuWyBJAg
         BZqg==
X-Gm-Message-State: AOAM530U8z286HPj+/ImUy071JZKGFpHk1o5fCnOBMrvgkcU70TEtvFz
        b+Hta6iI4g1L/s4QgmYEydc=
X-Google-Smtp-Source: ABdhPJwNz5IykOxSZ49GvZQ67utgu7Sq19F/1tUevm/gmcskQusvlJdzF1E9V8CoEor0rp7A6HBZsQ==
X-Received: by 2002:a17:90b:2247:b0:1e8:9f24:269a with SMTP id hk7-20020a17090b224700b001e89f24269amr5405690pjb.14.1654619974077;
        Tue, 07 Jun 2022 09:39:34 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id d15-20020aa797af000000b0051bbc198f3fsm12560272pfq.13.2022.06.07.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:39:33 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add i2c clock duty cycle property for setting minimum persentage of clock high
Date:   Wed,  8 Jun 2022 00:37:01 +0800
Message-Id: <20220607163703.26355-1-potin.lai.pt@gmail.com>
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

Introducing i2c-clk-duty-cycle-min property for setting minimum persentage
of clock high. 

This driver will go through base clock divisor and calculate a set of
high/low clock with duty cycle applied. if driver could not find a suit
high/low clock set, then it will use default duty cycle (50%) recalculate.

LINK: [v1] https://lore.kernel.org/all/20220530114056.8722-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20220601041512.21484-1-potin.lai.pt@gmail.com/

changes v2 --> v3:
* discard the properties for manual setting, use duty cycle to calculate
  high/low clock.

changes v1 --> v2:
* update bt-bindings documentation
* use meaningful values for properties instead of acture value in register

Potin Lai (2):
  aspeed: i2c: add clock duty cycle property
  dt-bindings: aspeed-i2c: add properties for setting i2c clock duty
    cycle

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  8 +++
 drivers/i2c/busses/i2c-aspeed.c               | 56 +++++++++++++++----
 2 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.17.1

