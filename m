Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5500E6F09E3
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 18:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244166AbjD0QbN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 12:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244167AbjD0QbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 12:31:11 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AC62733
        for <linux-i2c@vger.kernel.org>; Thu, 27 Apr 2023 09:31:10 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1881333ac1cso6271124fac.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Apr 2023 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682613069; x=1685205069;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=H/F2jXQhEspNf2OSg1QdhIunBBlXl0Bx9YZ26gqXk+Gs3zr1BMEJlTeL5k9J8P05bu
         GUKysimt65dWa99YmJSJVeBANdqJjBXt3KAmR09VKLgLmOByA2d4V1DF8VdJyCqx0WVy
         wTTi+XjWh1gjMd/UXjdaOWsjrs8U9CTZzav9EEzBxRv7ygMPsrF21nAtzIqBy0hd6bx/
         rVCC5lep6mjx7P7X7168S1kDfCavrY2GvkPNq436Edjl3h7XLL4NyZMlDGY38BE+C6i9
         hP37oyOZN9vjSf9M67zNMdGLB4TBOx9IpsMXcGi+Kf/odO+qLqN4KuSt+YvvfhtsbHfe
         wshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682613069; x=1685205069;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=cIm3el4R7NWroPkeGtjJ5KdFScLiMmrTT2q7+oKAkIaP+wwK7SggGgN3c3/Okn6oKJ
         wkEx98HeYjaGq7H7VBnNn8gXZj3qUgOS+J9ljBd1sDN8MyLI6DPl5GZsKy3Y7PXZdOj2
         jDXSIgxKac9UbmcEhQYbiL7DjW7YwgCH+FWNfzSZsiXyg7XPljT2D+sHZSLFouh/T/XY
         r5+qUBrnKKnssyFxrc4cM+CzESHkPlxp0LpNBmxkstJET/2qQf20JNehqix1A4vOlG9z
         pGGcIr16GTEUTVQ6O/Q+pMUdXcmZ8bnuMv9dfwsIdwtLNF55xT7D4tjdIrfqcflhXhJO
         ijlg==
X-Gm-Message-State: AC+VfDyWLVe/zHGhaq4WCqFW3jG7KU3tgr4gDOiU8v/GJrWaZ4x0z5xb
        eQ3MdPsw4lBiA8GX6RT2qBCf3dYGK5+7h6TmCl0=
X-Google-Smtp-Source: ACHHUZ4ZWPxxNS1Y5SSo3pDTzI3Cin5siRdLfLJT7PY3lt+Mg1tieNMQ61YcFP1SGBY5C2W7bo73rMjSg69Nd/lxy4o=
X-Received: by 2002:a05:6871:6b81:b0:188:10b8:5358 with SMTP id
 zh1-20020a0568716b8100b0018810b85358mr1352670oab.16.1682613069193; Thu, 27
 Apr 2023 09:31:09 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsthereseninna@gmail.com
Received: by 2002:a05:6358:2489:b0:f1:be9a:c0c5 with HTTP; Thu, 27 Apr 2023
 09:31:08 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Thu, 27 Apr 2023 09:31:08 -0700
X-Google-Sender-Auth: 2oW4L4Na4Ml9J-VMpu6qL-XIbgg
Message-ID: <CAKVHDg8feap+6aWmD4o2bHD1DZqj_4PvghR9nh0Cm1DaYdQB=A@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
