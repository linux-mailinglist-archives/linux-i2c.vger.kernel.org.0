Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594764EA2B7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 00:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiC1WR1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 18:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiC1WQj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 18:16:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C05158549
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 15:13:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id dr20so31450657ejc.6
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=TD/3LUZgHFDmqN3EiSjzbKNfwgw4oqz8AYDhYsZdbJw=;
        b=aBmyD4p31/Xf7oBZbSgFz3QlT5FttPvFCbnerde3h69mBtCL4zQwnPdObN2WWwRHh+
         2vm1aicGvRz+/ukhpb2yk1XgiU8njMy8Wt+RdDGW+E6H2Sh/EQ+bm7z0+RT7v79UyoQB
         aKjbZhHgBM45TEQTSadmf3/A18yue/GM2Uy+BVrl5EPb5JR3VFfy3mR45xF8azJwp28T
         YKwQi4uGzDWVnyanExU4amM6HfzYsA7P5FvXr4k2YHCDgq48bOoAQD/WWnGwwuU/jgv4
         Zq+SO8BOCmAyKYRKxsbGkT8Lz+JLC+Ijg6e4WbmY5Se8b9swTh/9wVV7l7YU93mG1tOw
         Kz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=TD/3LUZgHFDmqN3EiSjzbKNfwgw4oqz8AYDhYsZdbJw=;
        b=ZEIZOllf3YOtnE3f/Iky+ZBRc1G7+6M9BHKZ07cZ1TEm0Q8aYZqyOFcjGUR/PBoYys
         QezIwV/9a2RKrV385TRCysglqrTHuZpWpgN6ITo9nXjHnv9CEDzTZZzMaE+EDDfAz1lI
         MKBUF+URXoUL4cvbqapZ2xRGHadxe/XGm+qElFaIEvIJhciPTYRrXJDHSP5DEjI+qjbW
         5Ih7hgysGgyL7kvTnca913H8BHU2TwVZ9iCv7PJZsLzqylRDNIrc+a0Prvp05tvYdPak
         9G9H5WEfZbfpVwnr0xIVJjH8ZUlZzLRmiZ3Vzc1aKp0RVR+5QsZO+mIARTKyNG0Q/OeK
         3ZVw==
X-Gm-Message-State: AOAM5330lfGHNbfcyylVfgLhaU2NCHwkGxnv14vcLunSf+DEENOSzh5J
        TXfQPbClM44tlnZahkY6hfMlNSJZbmngY28RRt4=
X-Google-Smtp-Source: ABdhPJwtsV5Kchn+KJWcyJup+pdO2w20Vz8un5e9R9ZTvYHyzXuHgI3JohdGnmxM0e9nc3wFl09ot0MbAGD1+hpC2xY=
X-Received: by 2002:a17:906:b102:b0:6db:1487:e73 with SMTP id
 u2-20020a170906b10200b006db14870e73mr29245385ejy.474.1648505581930; Mon, 28
 Mar 2022 15:13:01 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: amegeejustineablavi@gmail.com
Received: by 2002:ab4:a12c:0:0:0:0:0 with HTTP; Mon, 28 Mar 2022 15:13:01
 -0700 (PDT)
From:   kalay manthey <sgtkalamanthey@gmail.com>
Date:   Mon, 28 Mar 2022 22:13:01 +0000
X-Google-Sender-Auth: C_zDPuCtF_reKmq_OLlSNWDSQ8E
Message-ID: <CAOugn_-1TDyG=brAQBYPTkFq+gVf+2rN37rEe0tpiwRmUO-RLA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sveiki, vai sa=C5=86=C4=93m=C4=81t manas zi=C5=86as? l=C5=ABdzu, p=C4=81rba=
udiet un atbildiet man.
