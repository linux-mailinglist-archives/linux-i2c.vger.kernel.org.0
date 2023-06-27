Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D5273FBDB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 14:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjF0MRf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 08:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjF0MRe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 08:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74C01BE5
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687868205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A1tzwOjzvNIIQMHyWV/M76eIB+EZFVKWOicLp48LPkY=;
        b=NhJa58TqdBLnLkQOf1rtVKOCv7ki2oppnF2Vgbtu3MvJPex6ltTQYGtCQjTZvy77lwMiiE
        Zpbv3T8SGYc94IxBuPqLRWq4uCHeb1erYw/rGRM24ks7PZk7PTbVxNWiOkaltm3U3XAzOu
        etJnoyO+jjgqUKA4q6bM1aLgzRoir5Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-R73xBnadN1-rqg4QgwXO2w-1; Tue, 27 Jun 2023 08:16:43 -0400
X-MC-Unique: R73xBnadN1-rqg4QgwXO2w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fa06fc72f2so25417095e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 05:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687868202; x=1690460202;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1tzwOjzvNIIQMHyWV/M76eIB+EZFVKWOicLp48LPkY=;
        b=i3JOBd34EX+EovmNxoxXwZUuZvJqjHS+rEIKi9XyDmq+Oh2VBWGC+fInYACtRzkzc9
         G+jNhWE9osczH73t4ttLnz66LnFJznp/unMdJNT4652kO8t07/ar2cMuRWs14Hs4hwmX
         AIiAPX6xzdbEChtvtm1MCAHeA3u6P3xj4b6ZfQMv1RlzmIH1LOnz0L29J+TmHMCDAlhp
         kzuki1xx9VhnVfHGupxmDpnOOgZXHA9h8HY1cG3ZnRz9vZb7OxP0iznhc9gFDWq+1MT2
         PTnN7DM1wFrxmjdl+dFSWml/hzKAmfYjZMN1PKRlDlwCZsqQZOYjXulGsysXZnZ3+nLF
         +TEg==
X-Gm-Message-State: AC+VfDzuOtRB3KMcFJUIh+hbQgIZQnNblyTTS0v126Smml27a2BNAK4+
        wsisFwByS7Mamz3Q8mEaM3/rcvdAX+GGQu78pKXxyx2pDLwONsJyQ1KVEOrSo6eGK0YWU33WeEU
        kSWUsCGgb4aX/q64WToUV
X-Received: by 2002:a5d:4091:0:b0:314:4d1:2402 with SMTP id o17-20020a5d4091000000b0031404d12402mr65417wrp.44.1687868202745;
        Tue, 27 Jun 2023 05:16:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73kZTtG2BEXPX/V3TkMlFYh+1FD7ANhBDVrpyvPaLJFX3ps45rV3irD+IIkKwAxeaHYF+mzQ==
X-Received: by 2002:a5d:4091:0:b0:314:4d1:2402 with SMTP id o17-20020a5d4091000000b0031404d12402mr65403wrp.44.1687868202392;
        Tue, 27 Jun 2023 05:16:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm10275223wrz.47.2023.06.27.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 05:16:41 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Update documentation to use .probe() again
In-Reply-To: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
References: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
Date:   Tue, 27 Jun 2023 14:16:40 +0200
Message-ID: <87a5wl2j87.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter") .probe() is the recommended callback to implement (again).
> Reflect this in the documentation and don't mention .probe_new() any
> more.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

