Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345162879A9
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 18:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgJHQFe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 12:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgJHQFd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 12:05:33 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF9FC061755;
        Thu,  8 Oct 2020 09:05:33 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id 33so6342809edq.13;
        Thu, 08 Oct 2020 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=+IxddX4oBk5xd+J6oJQDzodRCbBwVMmnfDSkK4eauMY=;
        b=PJkgtsftOWBXMcghiv2N5V7s2DI4hHtos1td/PMZB5oE8VKubxXLKA28eJcV9py7uN
         uMS4163wBmkcYYsUWWD+y6kjGXgPVun3sO17VnUKpKje2Qphzp78/oQe6NOgH0NYSJwx
         tAt4/i5oD+IEvEE29PDf1WBMxJhshOsn2Nt2Vkq8QgmRlwSUP3TwJSiOapMfhS2J2ACi
         k/qYpg0rOTn4ZAvh9d/66dMoQOElNdJWN0bNiWhJEi9eWmV2HKP09iYlRzBuUkMk9PSa
         MumZxYh69Brgba/XzTLHZWtlwpOzaaEgKszQa1ZqZopa7khuV8xRYvD+9wzppU8Afqmi
         4f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=+IxddX4oBk5xd+J6oJQDzodRCbBwVMmnfDSkK4eauMY=;
        b=EF7w2ohqGV10tMnmVi0HDKhQ0ytsUhIkxctLgH/JtZP2dEEKKrcZK05x9wknfK9gdV
         L4uP5insF/N+5wxnjIxSIf2szQn+wfeD/5vA1ve5ZC5WaSjub0kpulJ//u/Hhgq3zrYB
         s28/EtDPOmIE65nNVpZs9kUZhzAlmdtiK2mhksjn7Lyyyqugcd96y6+Ts1MAATE0CUGH
         zPLdU3XC6lDro1fqcvuceSjZhONMTFAyZBrQRTxwx8xjC7XFUa/O5tyON3/cPHWDC1h9
         5GcmBJzcD32E3CUHRSbsyYX4BmgKmP2mf6KvkBmQxVwqW7YU/kRAb3kY1WMao8K08Gfs
         k8gg==
X-Gm-Message-State: AOAM532LV8l63ZwyUMSUwsExfu8P4ddmt//row+Cm1D0jI4h5KJPquNH
        k680Qe52HmKp9PbN5ZV9U/g=
X-Google-Smtp-Source: ABdhPJwuTzS32L+O61zHpVqMV/uEtrOc60vbDockApCbavsHqfioCUhtSmoVPbaRjgAo16HxjFweRw==
X-Received: by 2002:a50:f613:: with SMTP id c19mr9803727edn.81.1602173132148;
        Thu, 08 Oct 2020 09:05:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id j24sm3863617edq.29.2020.10.08.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 09:05:31 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1kQYQ6-0007Is-Hl; Thu, 08 Oct 2020 18:05:30 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Sagar Kadam <sagar.kadam@openfive.com>
Cc:     "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv\@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-i2c\@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "andrew\@lunn.ch" <andrew@lunn.ch>,
        "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
        "palmer\@dabbelt.com" <palmer@dabbelt.com>,
        "aou\@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
        <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
        <87imbm4639.fsf@dell.be.48ers.dk>
        <DM6PR13MB345137AD526D0AAA6CE0DBDF970B0@DM6PR13MB3451.namprd13.prod.outlook.com>
Date:   Thu, 08 Oct 2020 18:05:30 +0200
In-Reply-To: <DM6PR13MB345137AD526D0AAA6CE0DBDF970B0@DM6PR13MB3451.namprd13.prod.outlook.com>
        (Sagar Kadam's message of "Thu, 8 Oct 2020 13:53:55 +0000")
Message-ID: <87eem84sad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Sagar" == Sagar Kadam <sagar.kadam@openfive.com> writes:

 > Hello Peter,
 >> Are both affected by this issue? if not, we will need to extend the code
 >> to handle them differently.
 >> 

 > No, this issue is present in FU540-C000 SoC i.e SoC- specific, and so I can check 
 > for the soc-compatible string as follows:

 > -       match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
 > -       if (match && (long)match->data == TYPE_SIFIVE_REV0)
 > +       if (of_device_is_compatible(pdev->dev.of_node,
 > +                                       "sifive,fu540-c000-i2c"))

 > Please let me know if this is okay.

Yes, that sounds sensible. Thanks.

-- 
Bye, Peter Korsgaard
