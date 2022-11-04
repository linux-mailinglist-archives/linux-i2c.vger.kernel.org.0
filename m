Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B952A619557
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 12:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiKDL2M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 07:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiKDL2L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 07:28:11 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EA32C12A
        for <linux-i2c@vger.kernel.org>; Fri,  4 Nov 2022 04:28:10 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id q127so4280476vsa.7
        for <linux-i2c@vger.kernel.org>; Fri, 04 Nov 2022 04:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=G8NT30lYCOYQYB5yzshQZJCtlVec+059qqe6ey6fmQ1FuBZD1p5mr4WJqisj4MOgxR
         Po0IADGA/B0QoW8NXbrUfpRmjGnMtZoBdyBINEvtXdF4wV20VaXDIxQk30B/HyHfq4jT
         OmOkkLzV2hrQc4oLrO4yp6oC4wjr2d8BY/Kt/Cr1YAYuMiLU9HBkA+b3xAXFlOlfCKt+
         /3BKQ6iY5E5IcCQRd/WK7wJsxVJzRd77G9DMqizIwjCMC/zBMnvhsmxWpPwnnTYTY4+B
         QQ8TCXO6Lww9FO5JTHZ9slNbT5yLILYuPJ68OBUF9TC6zAJXZ5D2qKegaJeRe3bKIA91
         upDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=0LXESg20uDCMVHM/bqawgix5jdxMrdZUWCcCP4+dDof+bmGRx5R7ydeQTI3z7z4Hke
         reCF6+gO+FRM5/27J5qM9rkWeL3tSzBvo40lKjGsGhWwPDA6oK1k9KjOz/3d6mhdLJtJ
         MF7regmPXW5N2VcFEv5kVznREnGQXcbJC02kYM6t4EShnXjmZQlQKBPjGt2+jaCznw+V
         q9B9trwJh3ScFnN1oidI9wQ9t4Wr7sttX+L0q/jlwVUVwm2v/6InYuS/1iiXW/v/Tb2y
         TamiBWAGNycEgvb5sF7xWQjHPbdEb518guqzNWe52yNmCQTuLAbaNrCjcRVuroT8lZV3
         UcWg==
X-Gm-Message-State: ACrzQf0gcqVK9V0z0HV3Y91CUhPBnSvR4ne9RZdYUhPk24pR+nQ1qbqx
        XWzd2HoLDIdoVM4snlASfl5NEegwsFezKciuuPc=
X-Google-Smtp-Source: AMsMyM6iI4d5DRCQb5udb5lp3ED5UsSC/WLCRgOQVhJo3/dSHbDxPX99BOzKH10MAf/4CFjdBjJTXCKYMhaU/e1rPvI=
X-Received: by 2002:a67:d207:0:b0:3aa:1f6b:9983 with SMTP id
 y7-20020a67d207000000b003aa1f6b9983mr19131527vsi.10.1667561289687; Fri, 04
 Nov 2022 04:28:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:7c48:0:b0:411:1626:68e9 with HTTP; Fri, 4 Nov 2022
 04:28:09 -0700 (PDT)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <reverendmichael00@gmail.com>
Date:   Fri, 4 Nov 2022 11:28:09 +0000
Message-ID: <CA+_+1VJm9e+GOewmnZc2KesqO+ij6Mv9dbabNF5WQdasvLSyMg@mail.gmail.com>
Subject: HI
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
