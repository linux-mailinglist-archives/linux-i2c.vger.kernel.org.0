Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86684ACA91
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 21:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbiBGUrv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 15:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242640AbiBGUmI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 15:42:08 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D02FC0401E1
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 12:42:08 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id q8so18374172oiw.7
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 12:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:subject:in-reply-to:message-id:references:mime-version;
        bh=aIR7KrDtJqCLnJ6yRWzpe9i6aIeGs2Rrzys79FVSx0Q=;
        b=dz3LSjSOVl7gUNM6a98y2Dqp0GO30yh2tr2rpvolTUSqFFcD0xXuKfUUmESN5+Op9K
         eLl8NuP+kRAsyyQDKc/5gfeW+Xk0/a1uh8SDOjMoQmwIWQZmOcXLc0pIj9LlXh4kdiyX
         0QhYyuC0BGWtK7IWmagFeUC8Au7Gy6962sJX49e4n5lUJ/Sc2NMwKyuR1UUYWS6T7pPB
         PJhMFVtfrIStFcsna6RV4XCyWl/rBiDVSBUJqeipa3DkMhYKuoZt7CapHo/BdtMz6rJ4
         ypl2rtEm4reuNAzBO1y09e0jkjvK/1KnviKd4djj8p+vMmrox4aGImsehdL2GxThLw7D
         RqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:in-reply-to:message-id
         :references:mime-version;
        bh=aIR7KrDtJqCLnJ6yRWzpe9i6aIeGs2Rrzys79FVSx0Q=;
        b=ED3NYpSspi1Qdg4Zm9KBwPOxypQZFnm/F8XK18WyNCB6rKWrxqDgHazyYH1Nh/PneR
         SwsojG69dGvoTYC0KDgQM0TdYhDW5e9a8h9vRAF4uDY+FYi1o6RaLXKWsY/2DXXbjdkU
         Z4xQKOu6SCtE+A7jhflxuVocV/Xt4Lv/EgbVMJnjdwLC+A6xaw2TYhMmyFKB7Nx3jYQU
         +4CdE3LOUJJ9SRVW8kvm2nemQ2cLViH81OuA9s+yu6T/IQoAmPxYP32ye/W1t/z4B1Pg
         0H7h1SfoqnjLws0FQVAsa508rcJGJoc0n57iCjkcL2T3VFHee7gF7kh5iF1KfLjOko6l
         /DBg==
X-Gm-Message-State: AOAM532Ctoq9ZPIODVSIyYeSjQKNmcJPv9S3eOtNlgE7R66z4QWVN1M6
        /TweL6e68FZN4B5heBpUvAHpAQ==
X-Google-Smtp-Source: ABdhPJwM5d10fPToNTaj8Ln27I71FtDDp3Apv4XrT49+MBRolD3+SV6kwkjKXVH+4ljVMwtNMcpFoA==
X-Received: by 2002:a05:6808:156:: with SMTP id h22mr336348oie.79.1644266527001;
        Mon, 07 Feb 2022 12:42:07 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f17sm4388344ots.40.2022.02.07.12.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 12:42:06 -0800 (PST)
Date:   Mon, 7 Feb 2022 12:41:55 -0800 (PST)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To:     Wolfram Sang <wsa@kernel.org>, Hugh Dickins <hughd@google.com>,
        Derek Basehore <dbasehore@chromium.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: 5.17-rc regression: X1 Carbon touchpad not resumed
In-Reply-To: <YgF/0QGFN4SppLKg@shikoro>
Message-ID: <62e369a0-831e-1346-3d8-c394fc49ddf6@google.com>
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com> <YgF/0QGFN4SppLKg@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 7 Feb 2022, Wolfram Sang wrote:
> Hello Hugh,
> 
> > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > ("i2c: enable async suspend/resume on i2c client devices")
> > and reverting that fixes it for me.
> 
> Thank you for the report plus bisection and sorry for the regression!
> 
> I will wait a few days if people come up with a fix. If not, I will
> revert the offending commit. Are you willing to test patches in case
> there will be some?

Many thanks for such quick response (I found it at rc1, but couldn't
spend time to bisect until yesterday).  Willing to test?  Absolutely.

Hugh
