Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E776E1C43
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 08:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjDNGQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 02:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjDNGQL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 02:16:11 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A395271;
        Thu, 13 Apr 2023 23:16:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id z9so16001153ejx.11;
        Thu, 13 Apr 2023 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681452966; x=1684044966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SbTsshoRiULEkzwBbQ+pYzOmV8qW1WFmOzv8hcmERH4=;
        b=R3bW5oFzORH25LIWr6Rg5plNyiNJTBt4KgKmYoJ2EKV6Z+dvmvaGm8n9S60SRjxiYe
         b0piYWEFo8jkbjnCYJeyVAdQT21K26c65Db46czCaRbusEzE21ycT8kybD0/+A6ICrQc
         QXzGi2XvyBRZMYbV0yMV+MSz8e+bUcRT6HgInsxtuCnkkiqzu5aLzoNsCYRs0SFQANgW
         B68p7HMqK3NyvxFlclBgEgJpDgXjCuRbKVs57Mw036ArKdMKDA5DnpjJvO/HvN/nKhoi
         rJpiBvezc2+XVSeQBcGKAi1Ycowo9f8W27quGoR6wgSWG95ufD4PPs00f4P0Dv5BYmye
         dO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681452966; x=1684044966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbTsshoRiULEkzwBbQ+pYzOmV8qW1WFmOzv8hcmERH4=;
        b=ZWTz9B0CCtLca4zs4Ny5UtvcsHJxyxXjSSDn+UNDEhCApYucacE/0OpYkhWd39GOZw
         gdkOGvUqDz76F+NVWxQFwKIsf2vD4nALhzHwqwmJooFWt3ZTpsiOt2VPkIkZkq8SAp9D
         OaSfy9mbcwYgwAd1C+45Uu7rBlPO29bll1ce9J9GbG0gFzQ1Bk/Ho0RMAvULq8+1TIvB
         zZq5/wKVHjK3nZYaJl9lmu5m9oWZrwvxXvYjRwOnHteCJcXmrGyY1D0mD6VlKOvS5KhL
         iZDeFiJmUvSLRkkRJ160KDIi9H2w0zyifcDgY2ffDgNICHd4bHEHCGI6i6xXLv6LFUJO
         czQA==
X-Gm-Message-State: AAQBX9fULy0NAnLCzKCpp4AGn3fb1CHm2mT5norJi8sGerEgECPFIG+b
        WWz1xiY5HN0RzOd9N/5OHLO2Vqg5awKEEumpyzY=
X-Google-Smtp-Source: AKy350YMUhpwGWLwdV8/zzTVOiBxJk0QUuemBr0E9mcNMXCso4UmTVAQLZ360/+Pv4eJ0mbEkifzTL8++3Wb+45xeDI=
X-Received: by 2002:a17:906:9b90:b0:947:9f2a:8ca0 with SMTP id
 dd16-20020a1709069b9000b009479f2a8ca0mr2583942ejc.10.1681452965680; Thu, 13
 Apr 2023 23:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
 <20230327-tegra-pmic-reboot-v4-3-b24af219fb47@skidata.com> <2df6f002-dcf8-1073-d0b5-a9843103096a@collabora.com>
In-Reply-To: <2df6f002-dcf8-1073-d0b5-a9843103096a@collabora.com>
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Fri, 14 Apr 2023 08:15:54 +0200
Message-ID: <CAJpcXm4RRV15UUzsrw_9s4-ifE0W0uKSsZ2sAJxojsoctaT8Ow@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mfd: tps6586x: use devm-based power off handler
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com, peterz@infradead.org,
        jonathanh@nvidia.com, Richard Leitner <richard.leitner@linux.dev>,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 13 Apr 2023, 22:37 Dmitry Osipenko,
<dmitry.osipenko@collabora.com> wrote:
> Handlers must return NOTIFY_DONE or notifier_from_errno(). Sorry for
> missing this previously.

Thanks!

AFAIU, notifier_from_errno() sets NOTIFY_STOP_MASK, which stops
atomic_notifier_call_chain() immediately. So I think NOTIFY_DONE is the
only valid return value for sys_off handlers, to not skip others. So I
think letting sys_off_notify() [1] always return NOTIFY_DONE might be a
good idea.

If so, we could return a "notify return errno" (or also a "normal
errno") from the handler, which is checked, but then replaced to
NOTIFY_DONE, in [1]. This would enable us to have a common place to
check for failed handlers.

Handlers then should only return NOTIFY_DONE when they are skipped (e.g.
when the requested reboot mode is not supported by the handler).
Otherwise, I think ETIME, ENOSYS or ENOTSUPP might fit when the
communication was successful, a possible delay awaited, but the return
was still reached. What do you think?

Thanks and best regards,
Benjamin

[1] https://elixir.bootlin.com/linux/v6.3-rc6/source/kernel/reboot.c#L327
