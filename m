Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F4C14674F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 12:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgAWL4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 06:56:20 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:42341 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgAWL4U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 06:56:20 -0500
Received: by mail-qv1-f68.google.com with SMTP id dc14so1311224qvb.9
        for <linux-i2c@vger.kernel.org>; Thu, 23 Jan 2020 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E3fMtGGO856lGM1PhiLZZhQc22C1nseMPeO3dxb+GLA=;
        b=0REIlpZVRZhBUBb1A6pWKfpE0zWzwb9I2G2r/VtAioTBIwqE/SXwtwiei2vJPQ6zNv
         o53+nRmuQWZv1zBLSmzbLDdpojfx0Z3UqLinnxtilZT6CeOhRt24ViuEHHRdmIxEn2IC
         Nd0rmzr2NjcVl5WULuScg2oCcVZZz9rt6Pkv8CypXfrY4vyEGCiGMkbKlpWTFjLlQ5AM
         p0F9WZpM/IG2LYFOTPRgXFRBN62+KHiTQIQKFicHj6b/ta2ExBc0+iUgcxJhHUph0rJu
         6oachBSoYdpcPOUnwmIRNPgX3GRU4znoc3XhCnyr8qSs4jouEQcPiAoJ1IcPXO1L4G+R
         oBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E3fMtGGO856lGM1PhiLZZhQc22C1nseMPeO3dxb+GLA=;
        b=MdJFS+MbYWldhAa+rAwbiz2+g/BaHSgMNVr3Zwh2zX0l5J51XygoL5SpOxHObIEkED
         87ifkofMLpD85Eon/lYjUkEWoy3V0Q/8VkDUo7Fgj3E5Nm/IyCOQfQXviDV3CqRGSXMs
         L170wM7sNJzdjZWbJ8uOfZCFZFptoWPtNwkJE1Bn9liSu/2sxs4Q2FKATIZxkm67Iaha
         6DjTuDlhlR96W5eIqqYFPFNKeht8nQb7kG0qpNsTNu/bdy4R7kQ6PgW9DFgQSofQI/vR
         9CB0+EMFqhgPuV+VXqlDvSdh/S4ztiLxF+HRuKKwt+WL/Qkzzaq9EywhwETInWMPJ9ra
         /wQA==
X-Gm-Message-State: APjAAAUWE1gBtLSaPSbmU6b6uNEKKpPX8/ltiin7grXOO2f0wIdBm8o5
        6X+fwQMW2m1uj0igeKPGnghXWShOA03zndqqTiNLfw==
X-Google-Smtp-Source: APXvYqyADb9YmjOzth3SnYMaulW2ettSIeSZNksKWx2BGDXwrzojRFgX+xKf5iLx+x20ML0MwvzYaGdXs+huu5uohtk=
X-Received: by 2002:a0c:d60e:: with SMTP id c14mr15254880qvj.76.1579780579275;
 Thu, 23 Jan 2020 03:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 23 Jan 2020 12:56:08 +0100
Message-ID: <CAMpxmJUuCbHjsx493L6+nv0KShoqhoS3dfMXGYaGmQ+JQKBipA@mail.gmail.com>
Subject: Re: [PATCH v10 1/4] dt-binding: eeprom: at24: add vcc-supply property
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 16 sty 2020 o 03:56 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> In some platforms, they disable the power-supply of eeprom due
> to power consumption reduction. This patch add vcc-supply property.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied.

Bartosz
