Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D16E7C69A9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 11:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbjJLJ3A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 05:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235572AbjJLJ2y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 05:28:54 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE98BDA
        for <linux-i2c@vger.kernel.org>; Thu, 12 Oct 2023 02:28:52 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4527d7f7305so324780137.1
        for <linux-i2c@vger.kernel.org>; Thu, 12 Oct 2023 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697102932; x=1697707732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1CmCoLPcwE9XAoTNjVot3oBuDAU5DOI+jyuV49vMEM=;
        b=vk1l//TkWau9mx0UAOH/+KqUhZA88sseKgtGAbd8WpVNyxKe1qJTjdDoTERs9/JRPl
         t/KyYDeYtLVLqeArRGMGet5yzcHmRUxQo0RvrVLKN3I6km3b3wzGKNTP4qfhdt8nmkMI
         u3+k4bOPMycXQsLCVL40M5fK7TkLriHFS3XOam5dXMsUbrzE36FWQEtSlC2LwyJfU/iw
         96HdQviJE+EXmyzsdPSsNW1b0GDN+EnbyCS8dlvTPvuVqCbMQeeVaY3FEB7ojfuT2C80
         WcRdHq5mOjLtdCvj5C5qMa/Oi5u1eu6I5M5VnjXPLsISrDlXCMefQJP/ogs15uEtuoAp
         YbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697102932; x=1697707732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1CmCoLPcwE9XAoTNjVot3oBuDAU5DOI+jyuV49vMEM=;
        b=rRkCgypO2gFLe6oSaQGv77Bea2t/slDZEWfxQ0bj5sQPcNVQgctN2vsnfD7vIfRT1I
         RRndjdgJ3495KHW+SjXf6X6krheyirVkD4OQv8VKCEifT5NPJ91tcDFB8cHf3iMHd/77
         w0U2UUG2bYh4rfIKCSHx2HqnJdRGxLb2O5z7Go5b21s4ApVuazOx9FTofKlgpTi0P66q
         MPMkn9FaK5AWBuQaaV+l4OEsRnr24njHqKjYX+MuF1sMLsBdxZrpDxBRY4F4x2/pNM6J
         o6aqByymEPU3x+KZGKXXAs8hGd89jXERedvMf6Eb5vM+fHLBBegf7QzVV8MWAnanD1HM
         HrJA==
X-Gm-Message-State: AOJu0YxBhw5nzV8FfyRNgSL5Mn8xrt3pp8XjAmYyQoLxhqUFPd9jc+H5
        rDg6s8jVYK39kRzEVZ9qpW6taMaIGuOQXyikYdKZPg==
X-Google-Smtp-Source: AGHT+IGIjMdJAJDNhNrxc++TeBiaDgGlbUXT4r12WVy52GtaJUwFG61cCoCFs6mY8RrDQFKLTKOH/R+TqV0kwK3vPE8=
X-Received: by 2002:a05:6102:3026:b0:44e:94b3:9253 with SMTP id
 v6-20020a056102302600b0044e94b39253mr21511339vsa.12.1697102931162; Thu, 12
 Oct 2023 02:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231010190926.57674-1-marex@denx.de> <20231010190926.57674-2-marex@denx.de>
In-Reply-To: <20231010190926.57674-2-marex@denx.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 11:28:40 +0200
Message-ID: <CAMRc=MdnqK7_LkcZf85x11G2x0jGL19sGOWydP-M0ZeC-WtYDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] eeprom: at24: add ST M24C32-D Additional Write
 lockable page support
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 10, 2023 at 9:09=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> The ST M24C32-D behaves as a regular M24C32, except for the -D variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 32 Bytes long and can contain additional data. Add entry
> for it, so users can describe that page in DT. Note that users still
> have to describe the main M24C32 area separately as that is on separate
> I2C address from this page.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied, thanks!

Bart
