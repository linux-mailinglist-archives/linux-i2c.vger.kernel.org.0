Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0469873DE74
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 14:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjFZMHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 08:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjFZMHH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 08:07:07 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2681B7
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 05:07:06 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1aa291b3fc7so3207424fac.1
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687781225; x=1690373225;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jqUIkHhKhqiLoJibv2sU7OMOfzsm7UQbFV/ay0I6P6E=;
        b=L6b4jvu0g84k/T2X+yulpz2+7nFlE8mhEsjyeQestFAGzeXsV51jVuElgZuwyMRx14
         paccU1CP0s9E2/2WO9VszlRZtzQSEWxTGWFq36qrcOcmA2gSXYZzqn8/AWv6UKpQ0QxB
         TEesWhhbcAeD/30ZOfRTIei4u/zwcemt45I0yDmPwLou99qy1XkkEK4HGSpqIBdwVAzK
         kISdkhLF5bnaNNivExcRFgIF/ddPuTO5sxI+YnmzaNjUyu81fuSDUE7+7kwxnZJp/lJ9
         h0LNsUxGXXP413xjTt3PUTovpHI71ruOyx2jAThLFWhyenFOKFhBRgV0YVOMRpHdYSh6
         K6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781225; x=1690373225;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqUIkHhKhqiLoJibv2sU7OMOfzsm7UQbFV/ay0I6P6E=;
        b=QV3bsUR21WT+lJti2exCai0BqpR3kdCdZLn5T8pBN1O4eB4Pmf6zC5COzBA+AfLFCP
         UXWsbC0louvm/WM7IOKQQVYzRgeRiMDiCzZwEspJluz16QlUpLMPEki2uYA2L6IuQW4G
         KKNiqP5aXwFm5l0WDQpXRdchjnmCfvDfTayWBwLhTdlohpA4phE0nlpaauEZk3cGrSmw
         AC29tLZVlvVHs7ppYvIjAslrNraS8dThHFjtjaWkUCQvxzyKd7fr6t58cJpsPEXWgSzQ
         N4e2QphoiZnUBEgfU0R8LYcuKKQ++/hgz2Qr4IGfU9R/MP+l3y0/Hu2jDyArSDyq2Ws/
         aUnA==
X-Gm-Message-State: AC+VfDwcC26s3TDRbIVcNn2/8NocEQPOG8SrRp7xJI2Wstwg7301zn+D
        b/or0qdZ1Yoc4KE1IkWKrqXeo7IIPao4hdmEKrA=
X-Google-Smtp-Source: ACHHUZ6qoqFRcMQ+EtpiUcRSNKiVWYtfSvJelYiFUgNYoFXghj3dyY6839KVSZIwJ6aN1jnPEJc4q1ehS6BnLlC1TBk=
X-Received: by 2002:a05:6870:d2a5:b0:1b0:49a7:c284 with SMTP id
 d37-20020a056870d2a500b001b049a7c284mr1313460oae.16.1687781225584; Mon, 26
 Jun 2023 05:07:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6870:fb90:b0:192:629b:a66d with HTTP; Mon, 26 Jun 2023
 05:07:05 -0700 (PDT)
From:   Suelly Tamie Shinozaki <desimahoolparty@gmail.com>
Date:   Mon, 26 Jun 2023 12:07:05 +0000
Message-ID: <CAHxOeTvgBpxoTkca-VQ0ZvtKCoc1jf3w+k3FP5BWfKgaWYrv6Q@mail.gmail.com>
Subject: nik_bin_nek_alwi@yahoo.com
To:     kinydi <kinydi@yahoo.com>,
        linux arm kernel <linux-arm-kernel@lists.infradead.org>,
        linux i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_40,BODY_SINGLE_URI,
        BODY_SINGLE_WORD,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SCC_BODY_SINGLE_WORD,
        SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE,
        T_SHORT_SHORTNER,T_TONOM_EQ_TOLOC_SHRT_SHRTNER autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

https://bit.ly/3Nq4VrJ
