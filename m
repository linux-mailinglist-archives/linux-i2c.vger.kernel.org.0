Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9B472B1F4
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jun 2023 15:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjFKNKV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 09:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFKNKU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 09:10:20 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E019B10DA
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 06:10:18 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-786e637f06dso1196920241.2
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686489018; x=1689081018;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7ZhYh521wqZIjgkPpyGpRYHntrQZ0TluHrGrja+CRM=;
        b=mU6RIOrF3DjSdM45/cUEoXwwI1C+/Ml/n0hyfEskEyYSAbxkdD+LCliPtGcDOWCqVr
         m/Zq7IcZh935MazqgNUgIw/vGaX76AERUH46AJLXNJ8ng/NxMJVGuct593jFWvwFhffD
         YgdOao72YfAVZBwT/7YfharcgcpZlaUZUqv6KzO4v8gGcX9K7OsSIvkU7ttTild/Kd/A
         dltRCcSr9oWg4RZH7aTAZrf6As9t507mFS8U1dxEYSIoPt7ewryklnJ4dw4YiztlwLP/
         drFNtF72ldM8scO2iM2BBR8Grf4j9wPEOiWYiGEt7ylcPeuOVd3QsxiW60KrWenOJ25I
         Zlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686489018; x=1689081018;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7ZhYh521wqZIjgkPpyGpRYHntrQZ0TluHrGrja+CRM=;
        b=C4MIiIiSzzaztMkD2JpCwT51z3+cz52bNL0tYYYi+x3Rfxex6353W68H2OLH5w0zT2
         cHiQqf/UkgixCuBiWiUuXteGGS0R//uVHt2yYJnjU97sZ92hzAngx9dohFkAZXsW+CGt
         /+Qh84xN6swuZwUhqSOufRRP06mhFrYqMxEAAbeMaLMfHg21oFeSIn99j7A4QRjdKoVd
         QBifDmhNYnFsHEdh18Yg/2XN9EGGNShKIKaBFPxHqDspUotQ0gMyW4Wo9El32F7zXwds
         wmHT5uF1kjCYFspdS66VOgurovPUzOPfvYdPj7gLEyAiz7rNXHh9XeTlbB8Y5nItzJRm
         Yv1w==
X-Gm-Message-State: AC+VfDyGl/ECP+yQUUbyBaHB4USKh5c7BIUeyHv5jU9YKRJmAAwWV9/s
        vvTxcSoRUdhkPsuJHy/uSPo/BNfmYvmpr4ZQp8k=
X-Google-Smtp-Source: ACHHUZ5ZzAbvG/WhdhR8tkUvi8TaDh2AcHMS8HsYjgGb2/5i+KObbtQrXfDRXuPHgom4/UGNAsf3dC1nxtNdQMEQTrQ=
X-Received: by 2002:a05:6102:1353:b0:43b:3c35:58ad with SMTP id
 j19-20020a056102135300b0043b3c3558admr2920203vsl.33.1686489017987; Sun, 11
 Jun 2023 06:10:17 -0700 (PDT)
MIME-Version: 1.0
Sender: jasimmeir525@gmail.com
Received: by 2002:a59:af59:0:b0:3c4:8f6d:234c with HTTP; Sun, 11 Jun 2023
 06:10:17 -0700 (PDT)
From:   Rose Darren <rosedarren82@gmail.com>
Date:   Sun, 11 Jun 2023 13:10:17 +0000
X-Google-Sender-Auth: PCCe-AnoOHNG08gy7ZFUJ0JJn7g
Message-ID: <CAAScEX-XkVdmH=+9ye5dai+8M5gjTc959DdxLzCtEuwfYahxDg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sauda=C3=A7=C3=A3o a voc=C3=AA
Voc=C3=AA recebeu minha mensagem ontem =C3=A0 noite para que possamos conve=
rsar mais?
