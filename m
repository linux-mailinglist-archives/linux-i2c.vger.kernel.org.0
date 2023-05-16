Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC2E70510D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 16:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjEPOoe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 10:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjEPOob (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 10:44:31 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ADB2705
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 07:44:28 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-452f317e304so3535612e0c.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684248267; x=1686840267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcJVNjZYuulczP4FAvRLKsVnZNEKfJxSvk96RKTgnPc=;
        b=GTyms4TBU7dPubvqTkV8Nb85cOFq4ka5+B4ok5bk1GmJF+C4Rm/p+L4Cbe1S2ptwp9
         U8hUl3Gbm9Jxa5nw5SeYLKQl8ne7qkk8me5Cbx7aUnky9jS2daR9Z9HZgEtlrwkTl0RO
         m6JM8YRGCi4TbI136MtLAMCJvzvRdpKW6bU2LL508ZPyTcP07yMPW+3xypBczKSZcnjx
         wYFNI5V8Dltugf4490zDPYpOvFxBLkoBln5vfeC7f/WvEVs71zlKXIsqtz0IXL5nF6OA
         jieMAaFh0ZTJY3JP6u3LuK2mRXs6VPzzga9hfHeYH87M90OC7urqMTrmw4nz3r3MIyBH
         syjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684248267; x=1686840267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcJVNjZYuulczP4FAvRLKsVnZNEKfJxSvk96RKTgnPc=;
        b=JVatlcdTCaDY4r+dImZ31yEFyw75YsC3ldZBnzNuWGfgjKuOtuKDSQXdmyswF+mngC
         TNuB1MO1lVcxf9m3CzHqjlurrCvuv3rEpBGUJJQN6JR4gOqHeBw2bdkC6LlRe6tkSC52
         YKaH5rTPZbw1yReJ2Cgvu79uvNIEywitUyqqx8aztqJDPvlQxWIe6iE3vlwlBrde4sW6
         9m4l4V4TsIoI+VQK61KZsDjBO1glyyPOQCAD7vwC17w9jKpqExiKLasVmIn955QMpJgL
         9Pgd3BJW0PVTrO/xtDn+oPRa8hRpvWCcYV1oyPmESnDgCPEseBNQhufhPUorDxY2MR6T
         0tBA==
X-Gm-Message-State: AC+VfDzKMjHJTmW072hzBKm6LYAj5y1W1eLFfMYZY5LsdbIJ3R0o7uzM
        aYxBZ5drZod12cPdU6rVUNVf6GTKaM7+gvgy1cBtfw==
X-Google-Smtp-Source: ACHHUZ7aBzNnok+Pb6HmZq4tvUCLSgt0EX5KOjtKGiY7vmtwWAoZWaGnhyaAvwP4dy3gh6t2CYBdEVAFgL8NS7+nfsc=
X-Received: by 2002:a1f:c905:0:b0:440:6ad:6b71 with SMTP id
 z5-20020a1fc905000000b0044006ad6b71mr13145822vkf.6.1684248266912; Tue, 16 May
 2023 07:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230516080553.427681-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230516080553.427681-1-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 16 May 2023 16:44:15 +0200
Message-ID: <CAMRc=MfaSvDSWRQohoacFdcbZB40_8RQKZ_=majo2KNPXKRf8w@mail.gmail.com>
Subject: Re: [PATCH 1/1] eeprom: at24: Use dev_err_probe for nvmem register failure
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 16, 2023 at 10:05=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> When using nvmem layouts it is possible devm_nvmem_register returns
> -EPROBE_DEFER, resulting in an 'empty' in
> /sys/kernel/debug/devices_deferred. Use dev_err_probe for providing
> additional information.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/misc/eeprom/at24.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 938c4f41b98c..5aae2f9bdd51 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -761,7 +761,8 @@ static int at24_probe(struct i2c_client *client)
>                 pm_runtime_disable(dev);
>                 if (!pm_runtime_status_suspended(dev))
>                         regulator_disable(at24->vcc_reg);
> -               return PTR_ERR(at24->nvmem);
> +               return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> +                                    "failed to register nvmem\n");
>         }
>
>         /*
> --
> 2.34.1
>

Applied, thanks!

Bartosz
