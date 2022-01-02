Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788D8482ABB
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jan 2022 11:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbiABKWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jan 2022 05:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiABKWO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jan 2022 05:22:14 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF06FC061574
        for <linux-i2c@vger.kernel.org>; Sun,  2 Jan 2022 02:22:13 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id v10-20020a05600c214a00b00345e59928eeso13146183wml.0
        for <linux-i2c@vger.kernel.org>; Sun, 02 Jan 2022 02:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=A5L6sOfCcSNZMKLN21Yzd8wv61rq1ptlP6VMHl28svC8edDTRLEEuB1Y/uuJdnSDVh
         HFoXDU99IohJPdrYJMA/KcS/1MiNs5u0Ngqn0DBOL7J9+MM7G7LjU3cAaVaDmvegB32N
         JeuI7K0JXDAsIDh0zNq8IKPVZ/eyrvma6MD81Z3V/X5UM/Hu7SRePYFfVoNYPbkhtXEJ
         FcUHuQTHyVSuPLLvfVIozq7WCvftHm7Qx3Jf5pd1YsoCcjxtNlAAIjc8S79kr4cNybLP
         Ni1K1XPXxs+KSwIQ14G9GsrlKs93IcVSwPXY5q8Ku1vnm5QWNTxWhWPJzhplhiqUl7Ve
         ebiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=p9QxmVr0r1nS0leocLRnD7C6t1lnn3+2wYdAoM1PfBvCImss/Pjoj0Wsz3O43vm88o
         0Tsad7b7E+Q/lPzKTxu5RMpW9G2tJ7Cm+MpWmPtZ++qCq0/Iwi8CWHsmnhOWxzYF5D6P
         fIXuKuas+ZH7hdfqTY4cryS3HET4SyLDGKKnkAn7LWzzz6SXFPaNjLd0f6/YqZaNbI4e
         PakpKnr4E0JGtHcTBRsPeJU+MJ5nOCxWH+z5+GkONOerkyXXBqdC6387A5B3I/u6xbwL
         +Vn2OHNtJzTI6U07w+xJhHWH4Y/n6npAv9MFnkclFXFxjEU3a65MKMy7NoSBbzh8OLt1
         cJUQ==
X-Gm-Message-State: AOAM5311LgeHcJBEKqQ3rgoIo8VQq1ZDwd/OxITrxuGDiwokhb8FndK/
        fUqEeB8/aaHUMYzvwqjvrzA=
X-Google-Smtp-Source: ABdhPJyx/rY1bKvRIkjNhsc7CoF5YE63FtZuY32OJFunLtd9gtaLXX0Cigy1dXppxviXP5R7uQrStg==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr35685440wma.95.1641118932208;
        Sun, 02 Jan 2022 02:22:12 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.105])
        by smtp.gmail.com with ESMTPSA id p18sm2495610wmq.23.2022.01.02.02.22.08
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jan 2022 02:22:11 -0800 (PST)
Message-ID: <61d17cd3.1c69fb81.3c161.83c6@mx.google.com>
From:   Margaret Leung KO May-yeee <yusufyaumuhammad@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yeee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Sun, 02 Jan 2022 11:22:03 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mrs. Margaret Leung I have a business proposal for you reach at: la67737=
777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
