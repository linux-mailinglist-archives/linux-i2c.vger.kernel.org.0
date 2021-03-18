Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6108534042E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhCRLG6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:06:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49097 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230169AbhCRLGx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 07:06:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MqUKlOrbN4XAGMqUNlIE1K; Thu, 18 Mar 2021 12:06:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616065611; bh=FcT1xJRYYG3zTya3jrkfWF6NJWw6BvsK98mlp9kKcjc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QdVSnxRaN0nB4jb90+F8yzawbcuBroe9sDjMeRs+JDHzKB6NfHy1NkOr/x39HssLJ
         qqg+o9SbqwiZMEF4LYUQHFVHPrEMj6j97v58uLqtZaRGyjLGUeTXh5mEeAdMtQPENo
         qqzhMitnv4AOSNQtzd1b5UfiXdp8r+CyxT7NHCmYWbsmI4LgAQSSuKnfF1TEZ9PZ6U
         IHpob+6QBskEZGqRAOnQfYlh0x4ymaKyCcdkLv9jLvEnP6+39fEgO4gC5bN10HEUUI
         N+YsmGKghybFParr0ChzWJFGo3RYaT3l3Cd0YXgLcBvA8sE/AZDNyLVFX0VWArw412
         0zb4dKpJjRvbg==
Subject: Re: [PATCH v2] media: i2c: adv7511: remove open coded version of
 SMBus block read
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
 <bea536b1-9d81-3f41-8ca5-7fb075422290@xs4all.nl>
 <cadc7e6e-377f-db65-514e-7b2e6a40a0ae@xs4all.nl>
 <20210318104330.GB974@ninjato>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5f5ea721-c68b-f64e-4398-cd4521c18d77@xs4all.nl>
Date:   Thu, 18 Mar 2021 12:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318104330.GB974@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMcIoxqdXTLp+7KIKq07oM6sqgYOlI6Byn4y7u+Wjh3sMhHw/fDnhNwhe0+i6pHj5MJBZAkMWytRk+OV2wZ5vkNV4jv1SVfjZa5mcFJFZSMjHdV46ELw
 Oli2Ugv6Tu/i/TIfrOg7EAFxG5I6MDcjE3YUQaMSR0cOqo6M/FQ9+5ou7TFe+mYd5MroA5rQJIauDHg1iyri/PVcEui4Fqiz0yY90MbGHqZ4q19W0Z3zdc56
 eSKeAK2I+MghgViGso1N6rw/Qbw69xuPn9rRC5Gm24s6YesmBgcZRy2hexeJgT5RcchtNwrfg9Zl00PM4U7GrQdatScwXr/hAN/4+uoUbQk=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/03/2021 11:43, Wolfram Sang wrote:
> 
>> I didn't hear back from you, so I'll pick it up for 5.13.
> 
> Thank you, Hans!
> 
> Can you pick up this one as well?
> 
> [PATCH 1/3] media: i2c: adv7842: remove open coded version of SMBus block write
> 

Ah, I thought you had picked that one up. Miscommunication.

I've delegated it to myself in our patchwork system, so it should appear in a PR
for 5.13 next week or so.

Regards,

	Hans
