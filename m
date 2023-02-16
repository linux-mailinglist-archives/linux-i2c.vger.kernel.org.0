Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E942699F00
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 22:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBPV2q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 16:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBPV2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 16:28:45 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935CEAF
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 13:28:44 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id hg24-20020a05600c539800b003e1f5f2a29cso5236462wmb.4
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 13:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vXJEuXGL6bDH3PwmPPaT3IM8ABOywFoq2Dgyfl9GkNU=;
        b=CW7vMzUoJEySEBH+1e50DKYtxZ9MIcG08b8+VXeuXXd9+gT9hKbVMFSxosokENj07M
         XLGvPoarUvQzsYxnvr9T/1bQQ8wEibeHdY4EXE6uXG/qzxh2kNtNyte2YvvjE8UoqXA2
         mZsWYpfvAQn7YHTZAzLpPzoLGYyuO0kITylI1tdDz2mg52sCnJ5LUmWn7C5DU2RZteo6
         D8Z98gntBwJFl53tr+4a2C4mjjcz12ZpW36ijzgHWjpBWr4slyrFguM9B0jmR0NTzNCK
         q6gQg9X4ovpHSpQMWAYrQsp7BUakBrjATKi7aHRAMR3DSUSvC4phBSuccDl2arFf3ImP
         SzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXJEuXGL6bDH3PwmPPaT3IM8ABOywFoq2Dgyfl9GkNU=;
        b=qo9zmEuR+zcRN0K1iyoMeuFPSlCfS5azD3dIt0XzXz3gURLuU36ySJSvuKwI5lqV/l
         EfmZEDsWcJ+dBFbZu389R/wmZVUUNg52XzkCvmZ4Jbhnu03wDo6DrryKeQNAyP6EbGi4
         QtJJlUw3FTy2hnrFujfggWSe+Lu6hjKJcSMnkfQzYHGxKgBBSzLxi4ICD7sGGN3odum/
         20DXtn6unUfAq5GjrKkkBBH5xr/Mqwzy6A55+F3BO2eSQ/n6ytyp2m1FEqIFnDCPfQV+
         HSpfSDC/hQ1HUadZ3sR1pH0Vw+iSQYRDTM9rKyETyLlblzFvSZoIGtOGLK+gilirMIpg
         XhGQ==
X-Gm-Message-State: AO0yUKXB9n2nYPjYbMXSz/aRpFiJTIqQdXUsqXOITfjvY54jgLFNVN1W
        9zPEsew7Y0h6ZdiP15BhoS41Rn109oQSheqgukc=
X-Google-Smtp-Source: AK7set/sg8rHUv2PLP4CHYtC1DfBOpClp57mBiHI4bLlkQOsMlzYIHH9RVpVwQhuZhX8dlBHdp7IXvC3BqpMlYXgBZg=
X-Received: by 2002:a05:600c:4e90:b0:3dc:53da:3274 with SMTP id
 f16-20020a05600c4e9000b003dc53da3274mr375815wmq.162.1676582923081; Thu, 16
 Feb 2023 13:28:43 -0800 (PST)
MIME-Version: 1.0
Sender: manchetejawara@gmail.com
Received: by 2002:a05:6000:259:0:0:0:0 with HTTP; Thu, 16 Feb 2023 13:28:42
 -0800 (PST)
From:   Miss Sherri <sherrigallagher409@gmail.com>
Date:   Thu, 16 Feb 2023 21:28:42 +0000
X-Google-Sender-Auth: AMBCa2j89DzSI5vztVRa9ULtOSg
Message-ID: <CAOZFZod8rPhMayr=F9dNBb01qNLCsnkDOw2dj5FYP7VoN+8fBQ@mail.gmail.com>
Subject: RE: Hi Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Fr=C3=A4ulein Sherri
