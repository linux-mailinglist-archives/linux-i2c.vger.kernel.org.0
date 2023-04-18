Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623B56E5A31
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 09:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjDRHPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 03:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjDRHPO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 03:15:14 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4640A526B;
        Tue, 18 Apr 2023 00:15:09 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2efac435608so1975506f8f.3;
        Tue, 18 Apr 2023 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681802108; x=1684394108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uR6hKEgJ/WbooXR55JY0BMqZFHcSBU4o6FYOEGHRgyA=;
        b=UP+TCCOU9uNmyeq3E7+qbnz0QLBtAzJP3W+naAwee8fuunB+fd/e0swWgFfCylWbTE
         BqtR9NDkHhcLKV0YyvhQBcrw6nr6CGRVCJMS8XdRXcz9cyPv5s8usLUO00tCiLVbdNHf
         AWaJ32mG9GZ5FyqaNAZym5vkVxi1g0ynwhF4UfMM8HKttAcbnVG2riJUlyc1/CRwpqsh
         igY5hQrJoqRXaHWyN8Rm253P8ejaMyeJIl60GwvNfMltK/9T5WVjsZXMBbHYlF+baBvG
         elD0wkODpPoNNLK4+Rp0ijR2qEoWXVN3UkFvK09y4B2iDtIg+j1mIqVQFyjkdonHnTRN
         NxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681802108; x=1684394108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uR6hKEgJ/WbooXR55JY0BMqZFHcSBU4o6FYOEGHRgyA=;
        b=dYD03oQyTh9qLptrrWK8TgztR8qmAMQ1HJaC7hx/xmztJCcaSpN7JybT8rwZCfq7Sk
         BXkkk1FqOdchVudxoj5lLH+L2q3g++bcpsD0B/mvVO8Tl2o28G7eFQ63I2sCXXL6NSg7
         fqOXK2+tcx8PSa6RHpcr3DMENFd2MP+/hetLeEC4XV1NGnYX61O0qUvRdLk3ffbJR134
         l1DBATGdQkMiyxI8aDqwvUeryKGNKqqc6hi9lQ3WC+1AJsLPtLyvUIMnXiBdMJUXGRp6
         HiPRsu32QevhoPsHMe/pMxYtdrzrimpoA9IVb3dmaN8Ph0AY/EFSIGG0r0Ex5GyJbis/
         7O1Q==
X-Gm-Message-State: AAQBX9e2qVh8LYAw82E0ZxcDZ8lqbjgd2VwgQ8QprhqKxxq+fXnzh05y
        PdmcUDKjX5exYQ7Y+LD1xvoIcX1766zpy2+8
X-Google-Smtp-Source: AKy350agm2Z0TfYvKA16znq7mVjHbhL6EwSRUsrHudxmt+CftfTF3FYC4p8xx6IIjCZhnp35hEzHvg==
X-Received: by 2002:adf:f8d1:0:b0:2f3:ebff:396c with SMTP id f17-20020adff8d1000000b002f3ebff396cmr1032268wrq.34.1681802107643;
        Tue, 18 Apr 2023 00:15:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c468e00b003f16ed11cf5sm8252782wmo.37.2023.04.18.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 00:15:07 -0700 (PDT)
Date:   Tue, 18 Apr 2023 10:15:03 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ocores: add missing unwind goto in
 `ocores_i2c_probe`
Message-ID: <2bbc856b-c65a-4b42-8193-3a990e2155c0@kili.mountain>
References: <20230418053814.117215-1-silver_code@hust.edu.cn>
 <82673cff-6571-43fc-9b64-3af2c72593c3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82673cff-6571-43fc-9b64-3af2c72593c3@kili.mountain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 18, 2023 at 08:45:20AM +0300, Dan Carpenter wrote:
> On Tue, Apr 18, 2023 at 01:38:13PM +0800, Wang Zhang wrote:
> > Smatch Warns:
> > drivers/i2c/busses/i2c-ocores.c:701 ocores_i2c_probe() warn:
> > missing unwind goto?
> > 
> > The error handling code after the err_clk label should be executed to
> > release any resources that were allocated for the clock if a negative
> > error code returned after platform_get_irq_optional.
> > 
> > Fix this by changing the direct return to `goto err_clk`. 
> > 
> > Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
> > ---
> > v2->v3: the first patch had issues. Just do a much simpler fix. No need 
> > to add the check. clk_disable_unprepare() has checks for error pointer 
> > and NULL already.
> > v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
> 
> I meant send it to the public mailing list.  Don't add the other
> comments which are related to discussions on this list.  Just say that
> the public 1 was buggy and the this new v2 patch is simpler.

Oh, sorry, this was to the public list.  Never mind.  (Technically both
lists are public).

Some of the notes in --- change log are probably confusing to the people
who aren't on the hust-os-kernel-patches@googlegroups.com list...  Maybe
it's only confusing to me...  LOL.  But the patch itself is straight
forward.

regards,
dan carpenter

