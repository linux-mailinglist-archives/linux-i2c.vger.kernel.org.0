Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823653AEAAB
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jun 2021 16:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFUODI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Jun 2021 10:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhFUODI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Jun 2021 10:03:08 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DDCC061574
        for <linux-i2c@vger.kernel.org>; Mon, 21 Jun 2021 07:00:52 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id s6so19058218edu.10
        for <linux-i2c@vger.kernel.org>; Mon, 21 Jun 2021 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tq7L4m1wR4nf2avsJUhGvz79H0pn5kEkLmUTmmD70LU=;
        b=meJG8mpBFM/zMPhsVlDJ0i3MoivqvcIzTVi/fB4eV2ZZslHG18VvY3CapbTpjNSVl7
         /CXGchW0RN65xG18zxeq/inUkBY9eNsal6dcjI+hk6ngHt4smIq5FFjS5HUZOIss74NT
         jwMYqrkcIBxzEkEKNbFKAaHXQJHFsTe3SvAL/GJxYg2fOL1SNNvtKo8aTwAYUl41j4CS
         DDa+uFIApA7tdXpfMOf8keZCgLxzpo4ettIEL7oxFhn1BLCpkH1V+yy0WxRNkzFYupcc
         HzShxlEeof5kncpwuKFvGnsP8V1F/vW4Fp+5gQkBkX1Aa/1AdeJVzeSIyc2SWgpZjKDT
         2S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=tq7L4m1wR4nf2avsJUhGvz79H0pn5kEkLmUTmmD70LU=;
        b=Vek2PHcSgXjIYvgN5sXCYajTKcCTDs4P7q1lWQJQw1JBcSrczeoO3hJJxTPdaqlWeP
         /NRoUxzWGAA6P51ni4Vam0jx9sPrHvDaErUmXe91yMCBym2284ULVVsQm8np+azpiOB9
         ULUs6qdzy4LI9YU+siYs3LJ2az/Nu+jGAoBwZH2/ifAQXhEhwRit/RFdt9xSfBgKwIql
         sPP/DPWc6TKeWYH7tks3yXGqE04DXak3kwYQT2bLSeJS6/augCELQjj9fr+BtNkw13mv
         DN2uG8wXgpLbCXaUN3aTwhztU3RpsDNEbylSzqifv8+dHmU1+3iBPrgvsEEO44xpeWW3
         zyyA==
X-Gm-Message-State: AOAM532pvVmnUIxt40QiOA5ZskLT8jTB+QkSmEhQOWTn6dWtwm7CyFln
        U+V2x1yg/OljxrRKgDGo47DuTFSpr9zMtM6n4eM=
X-Google-Smtp-Source: ABdhPJySpmT/5kos66ec+T8y4srukQydPlrU2DM8/nLR4Yd9aJ4zWXwj9EKW//qPSTU57s0tVIoAvR1iM8dhekIJDPk=
X-Received: by 2002:a05:6402:5143:: with SMTP id n3mr1988892edd.80.1624284051485;
 Mon, 21 Jun 2021 07:00:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:7496:0:0:0:0:0 with HTTP; Mon, 21 Jun 2021 07:00:51
 -0700 (PDT)
Reply-To: heritagebankorg435@gmail.com
From:   MR joe Ephrem <mrjoeeph83@gmail.com>
Date:   Mon, 21 Jun 2021 16:00:51 +0200
Message-ID: <CANg=ZrAZoh39JQomBnx2U0SqeP9cjKe=ktMdJW90D++sgRBCdg@mail.gmail.com>
Subject: =?UTF-8?B?R1JBVFVMQUNFIFbDgcW9RU7DnSBWw41UxJpa?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

R3JhdHVsdWplbWUuDQpWw6HFvmVuw70gdsO9aGVyY2khIFZhxaFlIGUtbWFpbG92w6EgYWRyZXNh
IGplIHZlIHNrdXRlxI1ub3N0aSBqZWRuw61tIHoNCnbDvWhlcmPFryBsb3NvdsOhbsOtIHYgNjAu
IGxldGVjaC4gVsO9aGVybsOtIGluZm9ybWFjZTogUE/EjEVUIFZTVFVQxa4gLi4uDQozNTctMDE0
Njc0NDYtMjI0LCBTw4lSSU9Ww4kgxIzDjVNMTy4gViByb2NlIDIwMjAgb3NsYXbDrW1lIDYwLiB2
w71yb8SNw60uIEsNCm5hxaFlbXUgNjAuIHbDvXJvxI3DrSBqc21lIHZ5enZlZGxpIHbDrWNlIG5l
xb4gMTYgbWlsaW9uxa8gVVNEICgxNiBtaWxpb27Frw0KVVNEKS4NCg0KVsWhaWNobmkgw7rEjWFz
dG7DrWNpIGJ5bGkgdnlicsOhbmkgcG9tb2PDrSBwb8SNw610YcSNZSBzIGhsYXNvdmFjw61tIHN5
c3TDqW1lbQ0Kc3Rhxb5lbsO9bSB6IGUtbWFpbG92w71jaCBhZHJlcyBzcG9sZcSNbm9zdGkgMjUg
MDAwLDAwIGEgMzAgMDAwLDAwLCBqYWtvxb4NCmkgamVkbm90bGl2w71jaCBlLW1haWxvdsO9Y2gg
YWRyZXMgeiB2w61jZSBuZcW+IDQwIHPDrXTDrSB2IEF1c3Ryw6FsaWksIG5hDQpOb3bDqW0gWsOp
bGFuZHUsIHYgSmnFvm7DrSBBbWVyaWNlIGEgdiBBbWVyaWNlLiBPZmljacOhbG7EmyBqc21lIG96
bsOhbWlsaSwNCsW+ZSB2w6HFoSBlLW1haWwgdnlocsOhbCAoNSA4MDAgMDAwLDAwLiB6ZSBzZXZl
cm7DrS4gQW1lcmlreS4gQWZyaWt5LA0KRXZyb3B5LCBBc2llIGEgQWZyaWt5IHYNClJlcHVibGlr
YSBMb23DqS1Ub2dvDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLg0KSnNlbSBEci4gRGF2aWQgUi4gTXVzdGFmYSwgxZllZGl0ZWwgYmFua3kgZMSbZGljdHbD
rSBMb21lIFRvZ28uDQoNCkphayBzZSBkbmVza2EgbcOhxaE/IERvdWbDoW0sIMW+ZSBqc2kgdiBw
b8WZw6Fka3UuIFLDoWQgYnljaCB2w6FzIGluZm9ybW92YWwsDQrFvmUgcGFuw60gVGhlbG1hIEli
ZW5lbWUga29uZcSNbsSbIHNvdWhsYXNpbGEgcyB0w61tLCDFvmUgdsOhbSBwb8WhbGVtZSA1IDgw
MA0KMDAwLDAwIFVTRCBwcm9zdMWZZWRuaWN0dsOtbSBvbmxpbmUgcMWZZXZvZHUgQ29yaXNiYW5r
LiBBIHbDocWhIHDFmWV2b2QgYnlsDQpzY2h2w6FsZW4gdmzDoWRvdSwgZG9zdGFuZXRlIGNlbGtl
bSA1IDgwMCAwMDAsMDAgVVNEIHYgcGxuw6kgdsO9xaFpIG5hIHN2xa9qDQpiYW5rb3Zuw60gw7rE
jWV0IHByb3N0xZllZG5pY3R2w61tIG9ubGluZSBiYW5rb3Zuw61obyBwxZlldm9kdSB6IGNvcmlz
YmFuay4NCkRvdWbDoW0sIMW+ZSByb3p1bcOtdGUgbcOpIHpwcsOhdsSbPw0KDQpVdmXEj3RlIMO6
cGxuw6kgYmFua292bsOtIMO6ZGFqZSBrIHDFmWV2b2R1LiBFLW1haWw6IChIZXJpdGFnZWJhbmtv
cmc0MzVAZ21haWwuY29tKQ0KDQpaZGUganNvdSBiYW5rb3Zuw60gw7pkYWplIHBvxb5hZG92YW7D
qSBwcm8gcMWZZXZvZCA9PT09PT09PT09PT0NCg0KTsOhemV2IHZhxaHDrSBiYW5reSA9PT09PT09
PT09PT09PT0NClZhxaFlIGFkcmVzYSBiYW5reSA9PT09PT09PT09PT09PT09PT0NCsSMw61zbG8g
dmHFoWVobyBiYW5rb3Zuw61obyDDusSNdHUgPT09PT09PT09PT09PT09PT0NCkvDk0QgU1dJRlRV
ID09PT09PT09PT09PT09PT09PQ0KVmHFoWUgY2Vsw6kgam3DqW5vID09PT09PT09PT09PT09PT09
PQ0KTmFza2Vub3ZhbsOhIGtvcGllIHBhc3UgPT09PT09PT09PT09PQ0KVmHFoWUgdGVsZWZvbm7D
rSDEjcOtc2xvID09PT09PT09PT09PT09PQ0KDQrEjGVrw6FtIG5hIHZhxaFpIG9kcG92xJvEjyBz
IHbDvcWhZSB1dmVkZW7DvW1pIGJhbmtvdm7DrW1pIMO6ZGFqaS4gcG9kxJtrb3ZhdA0KUyDDumN0
b3UsDQpEci4gRGF2aWQgUi4gTXVzdGFmYQ0K
