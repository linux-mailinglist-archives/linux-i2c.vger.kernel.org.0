Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0DA324CB9
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 10:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236161AbhBYJYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 04:24:21 -0500
Received: from air.basealt.ru ([194.107.17.39]:45666 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236283AbhBYJXq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 04:23:46 -0500
X-Greylist: delayed 571 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Feb 2021 04:23:45 EST
Received: by air.basealt.ru (Postfix, from userid 490)
        id 62BA358943A; Thu, 25 Feb 2021 09:13:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from nickel-ws.localdomain (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id 2642C589435;
        Thu, 25 Feb 2021 09:13:30 +0000 (UTC)
From:   Nikolai Kostrigin <nickel@basealt.ru>
Subject: Re: Need some help on "Input: elantech - add LEN2146 to SMBus
 blacklist for ThinkPad L13 Gen2"
Reply-To: nickel@basealt.ru
To:     linux-i2c@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <0d1eaadd-5350-63a4-fe6d-f8f357c49504@basealt.ru>
 <CAO-hwJLmByHHULhJF60qOUAqprkqZpSvVh-GFXLZ_ndL0guvPQ@mail.gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>
Organization: BaseALT
Message-ID: <e1fd99ae-8e46-0b21-1011-db73cd75523b@basealt.ru>
Date:   Thu, 25 Feb 2021 12:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLmByHHULhJF60qOUAqprkqZpSvVh-GFXLZ_ndL0guvPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, List!

I'd like to draw attention of Elantech and Lenovo engineers to an issue
of a non-working trackpoint.
Earlier this month I've discovered that Lenovo Thinkpad L13 trackpoint
doesn't work on Linux while touchpad does.
Both use elan_i2c + i2c_i801 drivers. The issue is confirmed for 5.4 and
5.10 kernels.

I had a preliminary discussion with Benjamin Tissoires and according to
our agreement I repost it for wider audience.
Blacklisting the device was decided to be a bad idea.
But actually I managed to get touchpad totally operational via SMBus
using a following hack:

providing a parameter to i2c_i801 driver:

modprobe i2c_i801 disable_features=0x2 (i.e. disable the block buffer).


If any additional information is needed I'm ready to provide it.
Some technical details on the issue we've managed to figure out  by now
are here-in-after:

19.02.2021 11:30, Benjamin Tissoires пишет:
> Hi Nikolai,
>
> On Thu, Feb 18, 2021 at 6:05 PM Nikolai Kostrigin <nickel@basealt.ru> wrote:
>> Hi, Benjamin!
>>
>> Sorry for bothering you directly.
>>
>> I have a question concerning the work on the issue we were discussing on
>> linux-input mailing list.
>>
>> https://patchwork.kernel.org/project/linux-input/patch/20210208075205.3784059-1-nickel@altlinux.org/
[...]
>> With elantech-smbus protocol I was getting persistent messages in dmesg:
>>
>> elan_i2c [...] 0000:00:1f.4 failed to read report data: -71
>>
>> I managed to track -71 (-EPROTO) error code to drivers/i2c/busses/i2c-i801.c
>>
>> Actually I managed to get Touchpad totally operational via SMBus using a
>> following hack:
>> providing a parameter to i2c_i801 driver:
>>
>> modprobe i2c_i801 disable_features=0x2 (i.e. disable the block buffer).
> ooh...
>
>> This makes code operating in other way and recover from illegal SMBus
>> block read size (giving warning messages in dmesg though).
>>
>>
>> [ 1270.105103] i801_smbus 0000:00:1f.4: Illegal SMBus block read size
>> from i801_isr_byte_done 93
>> [ 1270.119337] i801_smbus 0000:00:1f.4: Illegal SMBus block read size
>> from i801_isr_byte_done 93
>> [ 1270.133108] i801_smbus 0000:00:1f.4: Illegal SMBus block read size
>> from i801_isr_byte_done 93   <- theese are from trackpoint
>> [ 1270.167344] i801_smbus 0000:00:1f.4: Illegal SMBus block read size
>> from i801_isr_byte_done 93
>> [ 1399.869023] i801_smbus 0000:00:1f.4: SMBus block read size is 32
>> [ 1399.882266] i801_smbus 0000:00:1f.4: SMBus block read size is 32
>> [ 1399.896619] i801_smbus 0000:00:1f.4: SMBus block read size is 32
>> [ 1399.909850] i801_smbus 0000:00:1f.4: SMBus block read size is 32
>> <-  these are from touchpad
>> [ 1399.924117] i801_smbus 0000:00:1f.4: SMBus block read size is 32
>>
>>
>> We end up in this piece of code that has a built-in workaround and makes
>> Trackpoint work with SMBus
>>
>> NB: pay attention to /* FIXME: Recover */ priv->len = I2C_SMBUS_BLOCK_MAX;
>> All code snippets are from drivers/i2c/busses/i2c-i801.c here-in-after
>> (with some debug messages of mine).
>>
>> static void i801_isr_byte_done(struct i801_priv *priv)
>> {
>>         if (priv->is_read) {
>>                 /* For SMBus block reads, length is received with first
>> byte */
>>                 if (((priv->cmd & 0x1c) == I801_BLOCK_DATA) &&
>>                     (priv->count == 0)) {
>>                         priv->len = inb_p(SMBHSTDAT0(priv));
>>                         if (priv->len < 1 || priv->len >
>> I2C_SMBUS_BLOCK_MAX) {
>>                                 dev_err(&priv->pci_dev->dev,
>>                                         "Illegal SMBus block read size
>> from i801_isr_byte_done %d\n",
>>                                         priv->len);
>>                                 /* FIXME: Recover */
>>                                 priv->len = I2C_SMBUS_BLOCK_MAX;
>>                         } else {
>>                                 dev_dbg(&priv->pci_dev->dev,
>>                                         "SMBus block read size is %d\n",
>>                                         priv->len);
>>                         }
>>                         priv->data[-1] = priv->len;
>>                 }
>>
>>
>>
>> But with no param passed to i2c_i801 driver we end up here due to len=93
>> with our trackpoint:
>>
>> static int i801_block_transaction_by_block(struct i801_priv *priv,
>>                                            union i2c_smbus_data *data,
>>                                            char read_write, int command,
>>                                            int hwpec)
>> {
>>
>> [...]
>> status = i801_transaction(priv, xact);
>>         if (status)
>>                 return status;
>>
>>         if (read_write == I2C_SMBUS_READ ||
>>             command == I2C_SMBUS_BLOCK_PROC_CALL) {
>>                 len = inb_p(SMBHSTDAT0(priv));
>>                 if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
>>                 {
>>                         dev_err(&priv->pci_dev->dev,
>>                                         "!!!! Going to send EPROTO from
>> i801_block_transaction_by_block len= %d\n",
>>                                         len);
>>                         return -EPROTO;
>>                 }
>>                 data->block[0] = len;
>>                 for (i = 0; i < len; i++)
>>                         data->block[i + 1] = inb_p(SMBBLKDAT(priv));
>>         }
>>         return 0;
>>
>>
>> so the question is: whether trackpoint has a buggy firmware which
>> violates SMBus spec;
>>                     or it is really an I2C device which was erroneously
>> wired to SMBus i801 bridge...
> Good question.
> Couple of points:
> - these touchpads can only be used in SMBus as they use the Host
> Notify functionality
> - maybe the trackpoint on it should be handled differently
[...]
>> Please help me to decide what way to choose while developing a workaround.
>>
>> Should I correct trackpoint features list to not mess with 32-byte
>> buffer, or should I force it not to use SMBus at all and use only I2C
>> (if this at all possible).
> I think 2 types of people could help us there:
> - the elan engineers to give us the 'how this trackpoint is supposed
> to behave'. We can involve them in the public thread on linux-input
> - the i2c folks on how we can add a special quirk for these trackpoints.
[...]
> Cheers,
> Benjamin
>
>> --
>> Best regards,
>> Nikolai Kostrigin
>> ALT Linux Team
>>
-- 
Best regards,
Nikolai Kostrigin

