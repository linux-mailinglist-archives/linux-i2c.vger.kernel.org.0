Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED57D47D5F6
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 18:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhLVRpT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 12:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbhLVRpR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 12:45:17 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2D5C061574
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 09:45:16 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id by39so5020017ljb.2
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QF42aD0zscG+BtuAFRB/mrFD1dxXGx13co8vBNm/8Is=;
        b=hw8gF8Y37JT0pLwaOZRCkYbE0i2cTBRXJBsUPO606G+Khzs+zS6jw7qW3wIDAVZ12N
         t/QvTbJ9oR+HlA+/K3RLCdZ11fzZh9j27tVd9jyLZMjqPNQLS+wEACkGB8yAdd1fcrO0
         VKHuNvNs7Sf+hyqoxSmw8rzmSERCRnZMtJJBd/HCzuGOKZbTA4AZ3rU4r33MTUzLxbk2
         HjLXKuDbkJQhTm/H7SZYrN150qaU85/wFGtxYTSk2pjN+pu/SNNqvJzvPkYIGuvGmR3i
         yazlwLaspfImM/bk2fVk+IZkR/CfzdvgRSTLvazEpWNHhkGChlcF0u8852T9VrcqGLPA
         XaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=QF42aD0zscG+BtuAFRB/mrFD1dxXGx13co8vBNm/8Is=;
        b=dwN2SGzNTJbX9KltUJQa8rYQq+U9UcHJCs51sLwfPKYqQGyZT7eZsodxmwjhmG906B
         uCC1xOTbMH6tS9wduuLGe1DV83MK+K47rDi0zfzZWAuOXHNHwLuhASRLkq5xMMGeQvso
         dICSvwi47yCDrpXuU8hjz7lSSbFVKiMsk2SPYsNrk49p/5hL+TcjTwoKRYIUpKZrH1Bx
         v/nr1lO5+xqugDkXEuVPW24EThtYok1x3kk4MnqV5SNpziUXWAqfwqeeE5fkKxxsqUnE
         Y7XSUSir8rwkFPuvpMdyEDgVIxPXXfyMdtK3L6cHALnu2Zff6r6JlykKcg2u7stXOQwr
         DozA==
X-Gm-Message-State: AOAM532GwXJ2NFEzXl0AZzFj0cFJ42TX5HaNcIyPb8gjPm6KzCIlYGW4
        F87xTyTQSxDsO+D6yFJd10Hoz0TUllwv+N+BKic=
X-Google-Smtp-Source: ABdhPJwLQ3PNJsZMJTvCg38igSUBPam5TXvv0vJXkTSmP0XgoWoMHiL6wwhgKE+9tv5JwdIriHmVChw9dYHfr15GQTY=
X-Received: by 2002:a2e:96d0:: with SMTP id d16mr2013285ljj.330.1640195115046;
 Wed, 22 Dec 2021 09:45:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:88ca:0:0:0:0:0 with HTTP; Wed, 22 Dec 2021 09:45:13
 -0800 (PST)
Reply-To: camillejackson021@gmail.com
In-Reply-To: <CA+gc9O5Z96TZcX+TSP0-WR_zsMKSjMuWigidv3Lrhs4qK5Wi1g@mail.gmail.com>
References: <CA+gc9O5Z96TZcX+TSP0-WR_zsMKSjMuWigidv3Lrhs4qK5Wi1g@mail.gmail.com>
From:   camille jackson <aminoutchanile@gmail.com>
Date:   Wed, 22 Dec 2021 17:45:13 +0000
Message-ID: <CA+gc9O4BnctTefa7BME0ra=-S41f5QjnjEDiLp8vK-4XFyiHMQ@mail.gmail.com>
Subject: Pozdravy
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SmFrIHNlIGRuZXMgbcOhxaEsIGRvdWbDoW0sIMW+ZSBzZSBtw6HFoSBkb2LFmWUsIHByb3PDrW0g
b2Rwb3bEm3ogbWkgdGXEjywgZMOta3kNCg==
