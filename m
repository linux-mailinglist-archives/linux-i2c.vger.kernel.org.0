Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F896196F2
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 14:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbiKDNFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 09:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiKDNFL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 09:05:11 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55E638A
        for <linux-i2c@vger.kernel.org>; Fri,  4 Nov 2022 06:05:09 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id g16so2346674vkl.11
        for <linux-i2c@vger.kernel.org>; Fri, 04 Nov 2022 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p+2212nSs70KkMMypC1tbex5JQYbFSNyVBImxmcawE=;
        b=EWe/VEIPgEDuC4ALFRHz8MGvbLey2Ct+jg3a+a9n4u+IOmvbbp8xXz5iB6Fs8z2Xbm
         b9ilGiiTnbsVoAPVzHY8GPILvliiCuIZ0B2GA6zAyrvwcFjyM16xXFVMFcziEAj5ml5r
         JLPZNX5wHWffm0WE7q+xmQJMiu190ZpECmkvcQUjYYEdveSl1jKq9FLBB1q8yrBQ31G8
         XvJjedCFEXimQf2u9xD49ysAD6O6NnScbrjymzjN5RsQw551tGcbmubuOuchZlH7VPbY
         muEVN03nYo+/R4ReMg8PxDa7BemTA0n6WbIYjZFEoFqGLYqbIVFXa7QZKpYHTmThO+42
         MS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p+2212nSs70KkMMypC1tbex5JQYbFSNyVBImxmcawE=;
        b=OvznmjSxldyJHs+0bhS21os8sLG4h4c8odSRNV2ENYoe3yw5Wac7CIPlSRF6y1bIQt
         w3bsEifs9d3SapLxHrLRgaFD4oC11p11toq4vunC6YgG2Ts28/1QO60WiB77CL4eyTrz
         Qejlv4ls8nwPVYOjqfb8iqL7zvQBBXpS6SHdiz6e0UZOH9fP1s16encoo/72eOlG/k16
         rJkrfBxKvs0vff86nRU85ncWaNM2MKkMSBiTyRLN2BZNQeFXUZbcJdWQRwoJ0exwdPr3
         OobBtnTsNhYK7j0NSGk1LmQYO4e8hcMncd7QePA4lQj3kkgGOefieESplJyTpwArDpk5
         CrKA==
X-Gm-Message-State: ACrzQf27yKr/UDKWayQHVAjzE00J3JxfQLHR5CXnt97RR51IKWJ6VIY3
        EnDWdPNYQclBiyRF+OuBkUk1lAztrUpcpnJnO5o=
X-Google-Smtp-Source: AMsMyM6oPxXyeO3sUYBtKvpcdqQ+cODYUf3T/akeJLHgfyt896xxdOoQ3b8zvhBZ7+v63AAF4od2miwFNX2NZjYJEWQ=
X-Received: by 2002:a1f:c1d2:0:b0:3b4:a675:4346 with SMTP id
 r201-20020a1fc1d2000000b003b4a6754346mr19317083vkf.39.1667567108564; Fri, 04
 Nov 2022 06:05:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:a58d:0:b0:2f2:a342:51c1 with HTTP; Fri, 4 Nov 2022
 06:05:07 -0700 (PDT)
Reply-To: carolynclarke707@gmail.com
From:   Carolyn Clarke <brad.leagle011101@gmail.com>
Date:   Fri, 4 Nov 2022 15:05:07 +0200
Message-ID: <CAF=xrxSh2f3P-3UNO-0ohHTf+s+8cSCQMo+03TEx1qjTNO47og@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Good Day To You

I've viewed your profile on Linkedin regarding a proposal that has
something in common with you, kindly reply back for more details on my
private email: carolynclarke707@gmail.com

Thanks,
Carolyn Clarke,
carolynclarke707@gmail.com
