Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4624D7C57EF
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 17:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbjJKPTA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 11:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjJKPS7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 11:18:59 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B91194;
        Wed, 11 Oct 2023 08:18:58 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-77574c6cab0so494494385a.3;
        Wed, 11 Oct 2023 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697037537; x=1697642337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAcI5kh28MnQYwTA+kkn4Gx501jVpVqJkK13LuyHfzE=;
        b=WIKRx31+SZsTjloGBjXw/paj9PGpnyX33dhOpzLUOyghi1R9VYOqgHSLytBxyVhCUm
         NdAKOnKKsUDvTnqUptJrhi0Ga2n3WM7IxI+UbvuhqYd0QWHKuBcyXZRGZu8cK8QmG9cK
         bMQDyLg0UDx4w/JtCMkJ741N1MK6dEMgtQ0aVRcNhIWogiVOq+914lUPaL694HjkYHid
         MaQA9TQqhkLOeePQl8EyNBlijKoS98XLzQKVaykNc8SLrY3aXTFkr+29zxIKER7JMgUL
         3wYR8KtfieCGmVHUBnp3vnsYNxW1y6b00hu7ghkjiNYJURmjvZGBJoooKBqBqTyKZBu1
         6HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697037537; x=1697642337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAcI5kh28MnQYwTA+kkn4Gx501jVpVqJkK13LuyHfzE=;
        b=WTllKIHr1JimSbIiPUY8aZi+Wroof+iv9AayIF1bvHtAtCecTPm59qdvQgRmeeute+
         iLpkmGYqVRxSkLFxxav6I4A47kstD8M5BxAyWa/k4D6UrJTn0XdCLj74A1V2LdyHZnWU
         gtaC4tkG982IUA9YmHy/eMRrcOHVtJAtiPsiQCOcb1QZEYJJZBMjDZ1paYtRR4jBJuOC
         Ok0S1O/5xeXSSfaIXUUvVeKNsGClFVEUz0JU408/gpw3VYQxbetMiJo2LM9FQ+8BwyMb
         1nYjTNEiaiq3kO2jW78SvYsNDROpDmKUqN64G+jvnKVAqw23iWn90Xb3z9dy1zGZLmWi
         S53g==
X-Gm-Message-State: AOJu0YwuYsiyeerlKTJghKhI0XGhxjtMAnkmrHxm1U/BdoSPOdpdB2Sx
        TS3f1KC7ADpT8oqmhndXylkb5wXH5Bujgtsa07FIp7BcRzkfJA==
X-Google-Smtp-Source: AGHT+IHZ6uu1RYGgackfEPr6G8zsqdNYqsB+6ORtFqKPYZ/ZUjtzSlrxU+Br7yGEBhdvZ0kn1IbaglSvEVZ8pf3A3lE=
X-Received: by 2002:a05:6214:2b84:b0:656:49a3:21ae with SMTP id
 kr4-20020a0562142b8400b0065649a321aemr22859568qvb.15.1697037537354; Wed, 11
 Oct 2023 08:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-4-brgl@bgdev.pl>
 <b660e39e-24ad-c755-7962-aa56e8cdf4f7@axentia.se>
In-Reply-To: <b660e39e-24ad-c755-7962-aa56e8cdf4f7@axentia.se>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Oct 2023 18:18:19 +0300
Message-ID: <CAHp75VeKw-dkc+7TjZLGpgQaBXx+-u_eADdJ9o3-PcCAKRdwLg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: mux: gpio: don't fiddle with GPIOLIB internals
To:     Peter Rosin <peda@axentia.se>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 11, 2023 at 5:59=E2=80=AFPM Peter Rosin <peda@axentia.se> wrote=
:
> 2023-10-11 at 15:02, Bartosz Golaszewski wrote:

> > Use the relevant API functions to retrieve the address of the
> > underlying struct device instead of accessing GPIOLIB private structure=
s
> > manually.

> Very nice to see that wart gone! The only small question I have
> is if these helpers are needed elsewhere, or if a more "direct"
> gpiod_to_device() would have been sufficient?

Same concern is here. But I'm fine with the code.

--=20
With Best Regards,
Andy Shevchenko
