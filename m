Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F0D1613F3
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgBQNvk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:51:40 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:46780 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgBQNvk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:51:40 -0500
Received: by mail-lf1-f46.google.com with SMTP id z26so11891356lfg.13
        for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2020 05:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CWUnOwLrFtKopb+Y60N9EGpBz7+GIUoJzcWtgfbxsSQ=;
        b=JTeaPukF+f2GTlxgis2eIc6Eh3uBqTsFYQDRI2xfOvbwJqvMKIlC67SpE/WjBly5Pg
         onoWLb4ghtw99mSvYt4FPjKN8irX2uf7jKGvJaS//5flZNr3Ic5ygzPr1+yWhyRmyEXo
         y2pcz95ZL+O02jmtW9byIFgbTTPpj88t+UWJfmZI7ak9haLB3vtpKoP5IajaiuZmAtXV
         791SKL9sGfvDVFMw9kshnqD3m9KZgDPKNbOBQm48OVFHO8KGf17mvfqU2E3dZ61Wzd8N
         OK9nixjkGCBlyGncQk+5X/VjCKMuCf7KQAdqOGfB6Sr7oT6QgubPAWW0WgWvUuVBcbyG
         aJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CWUnOwLrFtKopb+Y60N9EGpBz7+GIUoJzcWtgfbxsSQ=;
        b=W7T7E0GDcLWxNX+bPS2Z6N5fxmepoLVSpgR0VRkvoy5/dJE6Kf7tkvs9+7WQtadmrp
         jM15faewriaT+QGMzk97ZHkjMwwB51zMCL1mfP0qkgz3G532kLYWl2+Yw0EePMCTzjG8
         wks2DGyyRk5njizIOqFAnSXJpHtB2ZnLJ4ovb5ytPeIQRN6vWShRrGO/XKzFhnJAtcI9
         CgxGm2jnf4PnTspQUgzBpdxGRePfKb1mMxrgCjbeafm8ZadNjYX/Kodq6D441D0pZMcp
         gZr8u6mTxM/3TZQWvmZ5P1EfJmDSHHF4qASVUFL2n4vhCmKTYxBLRerxDXxDNUysY/1s
         cd2Q==
X-Gm-Message-State: APjAAAXxdLZ+CNmYoFQZWWnCJt+jRfAcXTV1uoUOPBtHhgy10viCjFc1
        E+2bHD+nQ4gTjKO6vOGnqFJloyZ7jONMBhlCyFrK+C49
X-Google-Smtp-Source: APXvYqxER8D/hfn0d4TynDMh7hFSDaWVGBHDmUgoBmO8riwZNCOHQ7OOCG9qCnORtDTJYKSTchiiVWlTo3cs75r+DUY=
X-Received: by 2002:ac2:5f68:: with SMTP id c8mr7895674lfc.196.1581947498723;
 Mon, 17 Feb 2020 05:51:38 -0800 (PST)
MIME-Version: 1.0
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Mon, 17 Feb 2020 15:52:14 +0200
Message-ID: <CAHb3i=uXLgjT-emHeJzHGG5L_0z94ZwDYcX5vtaDf8+Eh90ziQ@mail.gmail.com>
Subject: npcm-I2c driver
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Just a reminder,
please take a look at this patch.
This patch is a new driver for npcm-i2c.
The patch has been waiting patiently for several months now...


https://patchwork.ozlabs.org/patch/1198846/


Thanks,

Tali Perry
Nuvoton Technologies
